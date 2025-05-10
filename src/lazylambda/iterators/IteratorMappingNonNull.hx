// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import lazylambda.NoItemsException;

@:generic
final class IteratorMappingNonNull<S: Iterator<T>, T, R> implements IIterator<R> {

    private final src: S;
    private final transform: (T) -> Null<R>;
    private var nextItem: Null<R>;
    
    public function new(src: S, transform: (T) -> Null<R>) {
        this.src = src;
        this.transform = transform;
        this.nextItem = null;
    }
    
    private function ensureNextItem(): Void {
    
        final src = this.src;
        while (this.nextItem == null) {
        
            if (!src.hasNext()) {
                break;
            }
            
            this.nextItem = this.transform(src.next());
        }
    }
    
    public function hasNext(): Bool {
        this.ensureNextItem();
        return this.nextItem != null;
    }
    
    public function next(): R {
        this.ensureNextItem();
        return switch (this.nextItem) {
            case null:
                throw new NoItemsException();
            case item:
                this.nextItem = null;
                item;
        };
    }
}

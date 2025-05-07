// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import lazylambda.NoItemsException;

@:generic
final class IteratorFilteringNonNull<S: Iterator<Null<T>>, T> implements IIterator<T> {

    private final src: S;
    private var nextItem: Null<T>;
    
    public function new(src: S) {
        this.src = src;
        this.nextItem = null;
    }
    
    private function ensureNextItem(): Void {
    
        final src = this.src;
        while (this.nextItem == null) {
        
            if (!src.hasNext()) {
                break;
            }
            
            this.nextItem = src.next();
        }
    }
    
    public inline function hasNext(): Bool {
        this.ensureNextItem();
        return this.nextItem != null;
    }
    
    public function next(): T {
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

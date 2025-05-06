// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import lazylambda.NoItemsException;

final class IteratorFilteringNonNull<T> {

    private final src: Iterator<Null<T>>;
    private var nextItem: Null<T>;
    
    public function new(src: Iterator<Null<T>>) {
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
    
    public function hasNext(): Bool {
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

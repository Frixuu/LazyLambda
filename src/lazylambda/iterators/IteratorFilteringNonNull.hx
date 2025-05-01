// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import haxe.Exception;

final class IteratorFilteringNonNull<T> {

    private final src: Iterator<Null<T>>;
    private var nextItem: Null<T>;
    
    public function new(src: Iterator<Null<T>>) {
        this.src = src;
        this.nextItem = null;
    }
    
    public function hasNext(): Bool {
    
        while (this.nextItem == null) {
        
            if (!this.src.hasNext()) {
                return false;
            }
            
            this.nextItem = this.src.next();
        }
        
        return true;
    }
    
    public function next(): T {
    
        if (!this.hasNext()) {
            throw new Exception("Iterator is empty");
        }
        
        final item: Null<T> = this.nextItem;
        if (item != null) {
            this.nextItem = null;
            return item;
        }
        
        throw new Exception("Unreachable");
    }
}

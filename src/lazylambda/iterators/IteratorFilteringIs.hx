// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import haxe.Exception;

final class IteratorFilteringIs<T, R> {

    private final src: Iterator<T>;
    private final matcher: Class<R>;
    private var nextItem: Null<R>;
    
    public function new(src: Iterator<T>, matcher: Class<R>) {
        this.src = src;
        this.matcher = matcher;
        this.nextItem = null;
    }
    
    public function hasNext(): Bool {
    
        while (this.nextItem == null) {
        
            if (!this.src.hasNext()) {
                return false;
            }
            
            final item: T = this.src.next();
            if (Std.isOfType(item, this.matcher)) {
                this.nextItem = cast item;
            }
        }
        
        return true;
    }
    
    public function next(): R {
    
        if (!this.hasNext()) {
            throw new Exception("Iterator is empty");
        }
        
        final item: Null<R> = this.nextItem;
        if (item != null) {
            this.nextItem = null;
            return item;
        }
        
        throw new Exception("Unreachable");
    }
}

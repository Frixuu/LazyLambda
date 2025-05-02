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
    
    private function ensureNextItem(): Void {
    
        final src = this.src;
        while (this.nextItem == null) {
        
            if (!src.hasNext()) {
                return;
            }
            
            final item: T = src.next();
            if (Std.isOfType(item, this.matcher)) {
                this.nextItem = cast item;
            }
        }
    }
    
    public function hasNext(): Bool {
        this.ensureNextItem();
        return this.nextItem != null;
    }
    
    public function next(): R {
        this.ensureNextItem();
        switch (this.nextItem) {
            case null:
                throw new Exception("Iterator is empty");
            case item:
                this.nextItem = null;
                return item;
        }
    }
}

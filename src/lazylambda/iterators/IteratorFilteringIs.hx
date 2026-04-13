// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import lazylambda.NoItemsException;

#if target.static @:generic #end
final class IteratorFilteringIs<S: Iterator<T>, T, R> implements IIterator<R> {

    private final src: S;
    private final matcher: Any;
    private var nextItem: Null<R>;
    
    public function new(src: S, matcher: Any) {
        this.src = src;
        this.matcher = matcher;
        this.nextItem = null;
    }
    
    private function ensureNextItem(): Void {
    
        final src = this.src;
        while (this.nextItem == null) {
        
            if (!src.hasNext()) {
                break;
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
        return switch (this.nextItem) {
            case null:
                throw new NoItemsException();
            case item:
                this.nextItem = null;
                item;
        };
    }
}

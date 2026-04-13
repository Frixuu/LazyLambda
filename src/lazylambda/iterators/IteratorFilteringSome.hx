// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import haxe.ds.Option;
import lazylambda.NoItemsException;

#if target.static @:generic #end
final class IteratorFilteringSome<S: Iterator<Option<T>>, T> implements IIterator<T> {

    private final src: S;
    private var nextItem: Option<T>;
    
    public function new(src: S) {
        this.src = src;
        this.nextItem = None;
    }
    
    private function ensureNextItem(): Void {
    
        final src = this.src;
        while (this.nextItem == None) {
        
            if (!src.hasNext()) {
                break;
            }
            
            this.nextItem = src.next();
        }
    }
    
    public function hasNext(): Bool {
        this.ensureNextItem();
        return this.nextItem != None;
    }
    
    public function next(): T {
        this.ensureNextItem();
        return switch (this.nextItem) {
            case None:
                throw new NoItemsException();
            case Some(item):
                this.nextItem = None;
                item;
        };
    }
}

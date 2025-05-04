// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import haxe.Exception;
import haxe.ds.Option;

final class IteratorFiltering<T> {

    private final src: Iterator<T>;
    private final predicate: (T) -> Bool;
    private var nextItem: Option<T>;
    
    public function new(src: Iterator<T>, predicate: (T) -> Bool) {
        this.src = src;
        this.predicate = predicate;
        this.nextItem = None;
    }
    
    private function ensureNextItem(): Void {
    
        final src = this.src;
        while (this.nextItem == None) {
        
            if (!src.hasNext()) {
                break;
            }
            
            final item: T = src.next();
            if (this.predicate(item)) {
                this.nextItem = Some(item);
            }
        }
    }
    
    public function hasNext(): Bool {
        this.ensureNextItem();
        return this.nextItem != None;
    }
    
    public function next(): T {
        this.ensureNextItem();
        switch (this.nextItem) {
            case None:
                throw new Exception("Iterator is empty");
            case Some(item):
                this.nextItem = None;
                return item;
        }
    }
}

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
    
    public function hasNext(): Bool {
    
        while (this.nextItem == None) {
        
            if (!this.src.hasNext()) {
                return false;
            }
            
            final item: T = this.src.next();
            if (this.predicate(item)) {
                this.nextItem = Some(item);
            }
        }
        
        return true;
    }
    
    public function next(): T {
    
        if (!this.hasNext()) {
            throw new Exception("Iterator is empty");
        }
        
        switch (this.nextItem) {
            case Some(item):
                this.nextItem = None;
                return item;
            case None:
                throw new Exception("Unreachable");
        }
    }
}

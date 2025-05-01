// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import haxe.Exception;
import haxe.ds.Option;

final class IteratorFilteringSome<T> {

    private final src: Iterator<Option<T>>;
    private var nextItem: Option<T>;
    
    public function new(src: Iterator<Option<T>>) {
        this.src = src;
        this.nextItem = None;
    }
    
    public function hasNext(): Bool {
    
        while (this.nextItem == None) {
        
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
        
        switch (this.nextItem) {
            case Some(item):
                this.nextItem = None;
                return item;
            case None:
                throw new Exception("Unreachable");
        }
    }
}

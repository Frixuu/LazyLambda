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
        switch (this.nextItem) {
            case None:
                throw new Exception("Iterator is empty");
            case Some(item):
                this.nextItem = None;
                return item;
        }
    }
}

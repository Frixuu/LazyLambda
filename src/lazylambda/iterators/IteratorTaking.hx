// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import lazylambda.NoItemsException;

final class IteratorTaking<T> {

    private final src: Iterator<T>;
    private var count: Int;
    
    public inline function new(src: Iterator<T>, count: Int) {
        this.src = src;
        this.count = count;
    }
    
    public inline function hasNext(): Bool {
        return this.count > 0 && this.src.hasNext();
    }
    
    public inline function next(): T {
    
        if (!this.hasNext()) {
            throw new NoItemsException();
        }
        
        this.count -= 1;
        return this.src.next();
    }
}

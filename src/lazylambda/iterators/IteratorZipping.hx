// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import lazylambda.NoItemsException;
import lazylambda.ds.Pair;

final class IteratorZipping<T, U> {

    private final left: Iterator<T>;
    private final right: Iterator<U>;
    
    public inline function new(left: Iterator<T>, right: Iterator<U>) {
        this.left = left;
        this.right = right;
    }
    
    public inline function hasNext(): Bool {
        return this.left.hasNext() && this.right.hasNext();
    }
    
    public inline function next(): Pair<T, U> {
    
        if (!this.hasNext()) {
            throw new NoItemsException();
        }
        
        return new Pair(this.left.next(), this.right.next());
    }
}

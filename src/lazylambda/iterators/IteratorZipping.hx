// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import lazylambda.NoItemsException;
import lazylambda.ds.Pair;

@:generic
final class IteratorZipping<ST: Iterator<T>, T, SU: Iterator<U>, U>
    implements IIterator<Pair<T, U>> {
    
    private final left: ST;
    private final right: SU;
    
    public inline function new(left: ST, right: SU) {
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

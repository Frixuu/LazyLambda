// SPDX-License-Identifier: MIT
package lazylambda.iterators;

@:generic
final class IteratorMapping<S: Iterator<T>, T, R> implements IIterator<R> {

    private final src: S;
    private final transform: (T) -> R;
    
    public inline function new(src: S, transform: (T) -> R) {
        this.src = src;
        this.transform = transform;
    }
    
    public inline function hasNext(): Bool {
        return this.src.hasNext();
    }
    
    public inline function next(): R {
        return this.transform(this.src.next());
    }
}

// SPDX-License-Identifier: MIT
package lazylambda.iterators;

final class IteratorMapping<T, R> {

    private final src: Iterator<T>;
    private final transform: (T) -> R;
    
    public inline function new(src: Iterator<T>, transform: (T) -> R) {
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

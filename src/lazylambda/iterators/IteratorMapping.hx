// SPDX-License-Identifier: MIT
package lazylambda.iterators;

final class IteratorMapping<T, R> {

    private final src: Iterator<T>;
    private final transform: (T) -> R;
    
    public function new(src: Iterator<T>, transform: (T) -> R) {
        this.src = src;
        this.transform = transform;
    }
    
    public function hasNext(): Bool {
        return this.src.hasNext();
    }
    
    public function next(): R {
        return this.transform(this.src.next());
    }
}

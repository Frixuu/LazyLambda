// SPDX-License-Identifier: MIT
package lazylambda.iterators;

final class IteratorTaking<T> {

    private final src: Iterator<T>;
    private var count: Int;
    
    public function new(src: Iterator<T>, count: Int) {
        this.src = src;
        this.count = count;
    }
    
    public function hasNext(): Bool {
        return this.count > 0 && this.src.hasNext();
    }
    
    public function next(): T {
    
        if (!this.hasNext()) {
            throw new haxe.Exception("Iterator is empty");
        }
        
        this.count -= 1;
        return this.src.next();
    }
}

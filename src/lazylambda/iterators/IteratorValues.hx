// SPDX-License-Identifier: MIT
package lazylambda.iterators;

final class IteratorValues<K, V> {

    private final src: KeyValueIterator<K, V>;
    
    public function new(src: KeyValueIterator<K, V>) {
        this.src = src;
    }
    
    public function hasNext(): Bool {
        return this.src.hasNext();
    }
    
    public function next(): V {
        return this.src.next().value;
    }
}

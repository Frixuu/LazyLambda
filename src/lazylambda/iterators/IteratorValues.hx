// SPDX-License-Identifier: MIT
package lazylambda.iterators;

final class IteratorValues<K, V> {

    private final src: KeyValueIterator<K, V>;
    
    public inline function new(src: KeyValueIterator<K, V>) {
        this.src = src;
    }
    
    public inline function hasNext(): Bool {
        return this.src.hasNext();
    }
    
    public inline function next(): V {
        return this.src.next().value;
    }
}

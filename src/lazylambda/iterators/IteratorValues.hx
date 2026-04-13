// SPDX-License-Identifier: MIT
package lazylambda.iterators;

#if target.static @:generic #end
final class IteratorValues<S: KeyValueIterator<K, V>, K, V> implements IIterator<V> {

    private final src: S;
    
    public inline function new(src: S) {
        this.src = src;
    }
    
    public inline function hasNext(): Bool {
        return this.src.hasNext();
    }
    
    public inline function next(): V {
        return this.src.next().value;
    }
}

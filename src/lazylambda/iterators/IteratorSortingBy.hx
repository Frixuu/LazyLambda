// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import haxe.ds.ArraySort;
import haxe.iterators.ArrayIterator;
import lazylambda.NoItemsException;
import lazylambda.ds.Pair;

using lazylambda.Prelude;

#if target.static @:generic #end
final class IteratorSortingBy<S: Iterator<T>, T, K> implements IIterator<T> {

    private final src: S;
    private final selector: (T) -> K;
    private final comparator: (K, K) -> Int;
    private var sortedIterator: Null<ArrayIterator<Pair<T, K>>>;
    
    public function new(src: S, selector: (T) -> K, comparator: (K, K) -> Int) {
        this.src = src;
        this.selector = selector;
        this.comparator = comparator;
        this.sortedIterator = null;
    }
    
    private function ensureNextItem(): Void {
        if (this.sortedIterator == null) {
            final array = this.src.map(item -> new Pair(item, this.selector(item))).toArray();
            ArraySort.sort(array, (a, b) -> this.comparator(a.right, b.right));
            this.sortedIterator = array.iterator();
        }
    }
    
    public function hasNext(): Bool {
        this.ensureNextItem();
        return this.sortedIterator.hasNext();
    }
    
    public function next(): T {
        this.ensureNextItem();
        return if (this.sortedIterator.hasNext()) {
            this.sortedIterator.next().left;
        } else {
            throw new NoItemsException();
        };
    }
}

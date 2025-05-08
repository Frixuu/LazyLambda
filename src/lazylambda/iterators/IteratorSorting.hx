// SPDX-License-Identifier: MIT
package lazylambda.iterators;

import haxe.ds.ArraySort;
import haxe.iterators.ArrayIterator;
import lazylambda.NoItemsException;
import lazylambda.Prelude.Collect;

@:generic
final class IteratorSorting<S: Iterator<T>, T> implements IIterator<T> {

    private final src: S;
    private final comparator: (T, T) -> Int;
    private var sortedIterator: Null<ArrayIterator<T>>;
    
    public function new(src: S, comparator: (T, T) -> Int) {
        this.src = src;
        this.comparator = comparator;
        this.sortedIterator = null;
    }
    
    private function ensureNextItem(): Void {
        if (this.sortedIterator == null) {
            final array = Collect.toArray(this.src);
            ArraySort.sort(array, this.comparator);
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
            this.sortedIterator.next();
        } else {
            throw new NoItemsException();
        };
    }
}

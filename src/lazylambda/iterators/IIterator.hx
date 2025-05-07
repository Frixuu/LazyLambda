// SPDX-License-Identifier: MIT
package lazylambda.iterators;

/**
    An explicit base interface for iterators.
**/
interface IIterator<T> {
    public function hasNext(): Bool;
    public function next(): T;
}

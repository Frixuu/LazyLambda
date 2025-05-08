// SPDX-License-Identifier: MIT
package lazylambda.ops;

import lazylambda.ds.RbTree;
import lazylambda.iterators.IIterator;
import lazylambda.iterators.IteratorFiltering;

final class Distinct {

    /**
        Returns only unique items from the source iterator.
        @param src The source iterator.
        @return A new iterator.
    **/
    @:generic
    public static extern inline overload function distinct<S: Iterator<Int>>(
        src: S
    ): IIterator<Int> {
        final treeSet = new RbTree<Int>((a, b) -> a - b);
        return new IteratorFiltering(src, item -> treeSet.insert(item, true));
    }
}

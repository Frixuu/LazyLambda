// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using TestUtils;
using lazylambda.Prelude;

class FirstTest extends Test {

    public function spec__Getting_the_first_element_does_not_drain_source_fully() {
        final src = (0...4);
        Assert.equals(0, src.firstOrThrow());
        Assert.isTrue(src.hasNext());
        Assert.equals(1, src.next());
        Assert.equals(3, src.firstOrThrow(i -> i.isGreaterThan(2)));
        Assert.isFalse(src.hasNext());
    }
}

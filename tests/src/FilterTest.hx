// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class FilterTest extends Test {

    public function spec__Filtering_should_handle_empty_sources() {
        final arr: Array<Int> = [];
        final iter = arr.iterator().filter(i -> i > 0);
        for (_item in iter) {
            Assert.fail("Should not iterate");
        }
        Assert.pass();
    }
}

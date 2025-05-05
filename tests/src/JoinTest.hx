// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class JoinTest extends Test {

    public function test__Strings_can_be_joined() {
        final src = ["Hello", "everyone", "!"];
        Assert.equals("(Hello everyone !)", src.iterator().join(" ", "(", ")"));
    }
}

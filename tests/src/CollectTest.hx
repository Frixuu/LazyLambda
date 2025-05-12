// SPDX-License-Identifier: MIT
package;

import utest.Assert;
import utest.Test;

using lazylambda.Prelude;

class CollectTest extends Test {

    public function test__Collecting_to_an_array_works() {
        final a = (0...3).toArray();
        Assert.same([0, 1, 2], a);
    }
    
    public function test__Collecting_to_a_Vector_works() {
        final v = (0...3).toVector();
        Assert.equals(3, v.length);
        Assert.equals(0, v.get(0));
        Assert.equals(1, v.get(1));
        Assert.equals(2, v.get(2));
    }
    
    public function test__Collecting_to_a_List_works() {
        final l = (0...3).toList();
        Assert.equals(3, l.length);
        Assert.equals(0, l.first());
        Assert.equals(2, l.last());
    }
    
    public function test__Collecting_an_IntIterator_to_a_map_works() {
        final m = (0...3).toMap(i -> Std.string(i), i -> i);
        Assert.same(["0" => 0, "1" => 1, "2" => 2], m);
    }
    
    public function test__Collecting_a_map_iterator_to_a_map_without_selectors_works() {
        final src = ["0" => 0, "1" => 1, "2" => 2];
        final dst = src.keyValueIterator().toMap();
        Assert.same(src, dst);
    }
    
    public function test__Collecting_a_map_iterator_to_a_map_with_selectors_works() {
        final src = ["0" => 0, "1" => 1, "2" => 2];
        final dst = src.keyValueIterator().toMap(pair -> pair.key, pair -> pair.value + 1);
        Assert.equals(1, dst.get("0"));
        Assert.equals(2, dst.get("1"));
        Assert.equals(3, dst.get("2"));
    }
}

// SPDX-License-Identifier: MIT
package lazylambda.ds;

/**
    A set backed by a red-black tree,
    with only a minimal subset of its methods implemented.
**/
@:generic
final class RbTreeSet<T> {

    private final comparator: (T, T) -> Int;
    private var root: Null<Node<T>>;
    
    public function new(comparator: (T, T) -> Int) {
        this.root = null;
        this.comparator = comparator;
    }
    
    /**
        Inserts a given value to this tree set,
        if no equivalent value has been inserted before.
        @param value The value to insert.
        @return `true` if the value was inserted, `false` otherwise.
    **/
    public function insert(value: T): Bool {
        var newParent: Null<Node<T>> = null;
        var tmp: Null<Node<T>> = this.root;
        
        while (tmp != null) {
            newParent = tmp;
            final comparison = this.comparator(value, tmp.value);
            if (comparison < 0) {
                tmp = tmp.left;
            } else if (comparison > 0) {
                tmp = tmp.right;
            } else {
                return false;
            }
        }
        
        final node: Node<T> = new Node(value);
        node.parent = newParent;
        if (newParent == null) {
            this.root = node;
            node.color = Black;
        } else {
            final comparison = this.comparator(value, newParent.value);
            if (comparison < 0) {
                newParent.left = node;
            } else {
                newParent.right = node;
            }
            this.postInsert(node);
        }
        
        return true;
    }
    
    private function postInsert(node: Node<T>): Void {
    
        var tmp: Null<Node<T>> = null;
        while (node.parent != null && node.parent.color == Red) {
            if (node.parent == node.parent.parent.right) {
                tmp = node.parent.parent.left;
                if (tmp != null && tmp.color == Red) {
                    tmp.color = Black;
                    node.parent.color = Black;
                    node.parent.parent.color = Red;
                    node = node.parent.parent;
                } else {
                    if (node == node.parent.left) {
                        node = node.parent;
                        this.rightRotate(node);
                    }
                    node.parent.color = Black;
                    node.parent.parent.color = Red;
                    this.leftRotate(node.parent.parent);
                }
            } else {
                tmp = node.parent.parent.right;
                if (tmp != null && tmp.color == Red) {
                    tmp.color = Black;
                    node.parent.color = Black;
                    node.parent.parent.color = Red;
                    node = node.parent.parent;
                } else {
                    if (node == node.parent.right) {
                        node = node.parent;
                        this.leftRotate(node);
                    }
                    node.parent.color = Black;
                    node.parent.parent.color = Red;
                    this.rightRotate(node.parent.parent);
                }
            }
            
            if (node == this.root) {
                break;
            }
        }
        
        this.root.color = Black;
    }
    
    private function leftRotate(node: Node<T>): Void {
        final tmp: Node<T> = node.right;
        node.right = tmp.left;
        if (tmp.left != null) {
            tmp.left.parent = node;
        }
        tmp.parent = node.parent;
        if (node.parent == null) {
            this.root = tmp;
        } else if (node == node.parent.left) {
            node.parent.left = tmp;
        } else {
            node.parent.right = tmp;
        }
        tmp.left = node;
        node.parent = tmp;
    }
    
    private function rightRotate(node: Node<T>): Void {
        final tmp: Node<T> = node.left;
        node.left = tmp.right;
        if (tmp.right != null) {
            tmp.right.parent = node;
        }
        tmp.parent = node.parent;
        if (node.parent == null) {
            this.root = tmp;
        } else if (node == node.parent.right) {
            node.parent.right = tmp;
        } else {
            node.parent.left = tmp;
        }
        tmp.right = node;
        node.parent = tmp;
    }
}

@:generic
private final class Node<T> {

    /**
        The data stored in this node.
    **/
    public final value: T;
    
    /**
        The color of this node.
    **/
    public var color: Color;
    
    /**
        The left child of this node.
    **/
    public var left: Null<Node<T>>;
    
    /**
        The right child of this node.
    **/
    public var right: Null<Node<T>>;
    
    /**
        A reference to the parent of this node.
    **/
    public var parent: Null<Node<T>>;
    
    public function new(value: T) {
        this.value = value;
        this.color = Red;
        this.left = null;
        this.right = null;
        this.parent = null;
    }
}

private enum abstract Color(Bool) {

    /**
        Red color.
    **/
    public var Red = true;
    
    /**
        Black color.
    **/
    public var Black = false;
}

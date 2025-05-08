// SPDX-License-Identifier: MIT
package lazylambda.ds;

/**
    A red-black tree,
    with only a minimal subset of its methods implemented.
**/
@:generic
final class RbTree<T> {

    private final comparator: (T, T) -> Int;
    private final sentinel: Node<T>;
    private var root: Node<T>;
    
    public function new(comparator: (T, T) -> Int) {
    
        this.sentinel = {
            final node: Node<T> = new Node(null, null);
            node.color = Black;
            node;
        };
        
        this.root = this.sentinel;
        this.comparator = comparator;
    }
    
    /**
        Inserts a given value to this tree.
        @param value The value to insert.
        @param onlyIfAbsent If `true`, the value will only be inserted
        if an equivalent value has not been inserted before.
        @return `true` if the value was inserted, `false` otherwise.
    **/
    public function insert(value: T, onlyIfAbsent: Bool): Bool {
    
        var newParent: Null<Node<T>> = null;
        var tmp: Node<T> = this.root;
        
        while (tmp != this.sentinel) {
            newParent = tmp;
            final comparison = this.comparator(value, tmp.value);
            if (comparison < 0) {
                tmp = tmp.left;
            } else if (comparison > 0) {
                tmp = tmp.right;
            } else if (!onlyIfAbsent) {
                tmp = tmp.right;
            } else {
                return false;
            }
        }
        
        final node: Node<T> = new Node(value, this.sentinel);
        node.parent = newParent;
        if (newParent == null) {
            this.root = node;
            node.color = Black;
        } else {
            final comparison = this.comparator(value, tmp.value);
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
        while (node.parent.color == Red) {
            if (node.parent == node.parent.parent.right) {
                tmp = node.parent.parent.left;
                if (tmp.color == Red) {
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
                if (tmp.color == Red) {
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
        if (tmp.left != this.sentinel) {
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
        if (tmp.right != this.sentinel) {
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
        The color of this node.
    **/
    public var color: Color;
    
    /**
        The data stored in this node.
    **/
    public var value: Null<T>;
    
    /**
        The left child of this node.
    **/
    public var left: Node<T>;
    
    /**
        The right child of this node.
    **/
    public var right: Node<T>;
    
    /**
        A reference to the parent of this node.
    **/
    public var parent: Null<Node<T>>;
    
    public function new(value: Null<T>, sentinel: Node<T>) {
        this.value = value;
        this.color = Red;
        this.left = sentinel;
        this.right = sentinel;
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

# Create a tree node from head and LR branches.
def node(head; l; r): {v: head, l: l, r: r};

# Create an order object to iterate over, letting build_tree be tail recurison
# optimized by taking a single object argument.
def order(preord; inord): {preorder: preord, inorder: inord};

def build_tree:
  # Gets root node of (sub)tree
  (.preorder | first) as $root |

  # Gets root nodes index in inorder set
  (.inorder  | index($root)) as $root_index |

  # Ensure pre-order and post-order has same length
  if  (.preorder|length) != (.inorder|length)
    then "traversals must have the same length" | halt_error

  # Ensure pre-order and post-order contains same elements
  elif (.preorder|sort) != (.inorder|sort)
    then "traversals must have the same elements" | halt_error

  # Ensure no repeated items (contingent on previous checks)
  elif (.preorder|sort) != (.preorder|sort|unique)
    then "traversals must contain unique items" | halt_error

  # Return empty if pre-order and post-order aren't empty (contingent on
  # previous checks)
  elif  .preorder|length  == 0
    then {}

  # Return head node if pre-order and post-order has single node (contingent on
  # previous checks)
  elif  .preorder|length  == 1
    then node(.preorder[0];{};{})

  # Create the tree :3
  else
    node(
      .preorder[0];
      order(
        .preorder[1:$root_index+1];
        .inorder[:$root_index]
      ) | build_tree;
      order(
        .preorder[$root_index+1:];
        .inorder[$root_index+1:]
      ) | build_tree
    )
  end;

build_tree

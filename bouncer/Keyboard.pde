/**
Keeping track of key presses on the keyboard
*/

import java.util.*;

public class Keyboard {
  
  public static final int P1_LEFT = LEFT;
  public static final int P1_RIGHT = RIGHT;
  public static final int P2_LEFT = 'a';
  public static final int P2_RIGHT = 'd';
  
  private Stack<Integer> keys;
  private int left;
  private int right;
  private int size;
  
  
  public Keyboard(int left, int right) {
    this.keys = new Stack<Integer>();
    this.left = left;
    this.right = right;
    this.size = 0;
  }
  
  public void pressKey(int key) {
    if (this.size < 2) {
      keys.push(key);
      this.size++;
    }
    
  }
  
  public void releaseKey(int key) {
    // key released is on top of stack
    if (keys.peek() == key) {
      keys.pop();
    } else { // key not on top of stack
      int temp = keys.pop();
      keys.pop();
      keys.push(temp);
    }
    this.size--;
  }
  
  /**
  * Returns 0 is no keys currently pressed, returns key otherwise
  */
  public int currentKey() {
    if (keys.empty()) {
     return 0; 
    } else {
      return keys.peek();
    }
  }
  
  public int left() {
    return this.left;
  }
  
  public int right() {
    return this.right;
  }
  
}

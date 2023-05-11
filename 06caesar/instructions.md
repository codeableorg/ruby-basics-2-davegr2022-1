# Caesar

> The following setting is taken from CS50 (if it isn't broken, don't fix it 😁)

Supposedly, Caesar (yes, that Caesar) used to “encrypt” (i.e., conceal in a
reversible way) confidential messages by shifting each letter therein by some
number of places. For instance, he might write A as B, B as C, C as D, …, and,
wrapping around alphabetically, Z as A. And so, to say HELLO to someone, Caesar
might write IFMMP. Upon receiving such messages from Caesar, recipients would
have to “decrypt” them by shifting letters in the opposite direction by the same
number of places.

The secrecy of this “cryptosystem” relied on only Caesar and the recipients
knowing a secret, the number of places by which Caesar had shifted his letters
(e.g., 1). Not particularly secure by modern standards, but, hey, if you’re
perhaps the first in the world to do it, pretty secure!

Unencrypted text is generally called plaintext. Encrypted text is generally
called ciphertext. And the secret used is called a key.

To be clear, then, here’s how encrypting HELLO with a key of 1 yield IFMMP:

| plaintext    | H   | E   | L   | L   | O   |
| ------------ | --- | --- | --- | --- | --- |
| + key        | 1   | 1   | 1   | 1   | 1   |
| = ciphertext | I   | F   | M   | M   | P   |

More formally, Caesar’s algorithm (i.e., cipher) encrypts messages by “rotating”
each letter by k positions. More formally, if p is some plaintext (i.e., an
unencrypted message), pi is the ith character in p, and k is a secret key (i.e.,
a non-negative integer), then each letter, ci, in the ciphertext, c, is computed
as

ci = (pi + k) % 26

wherein % 26 here means “remainder when dividing by 26.” This formula perhaps
makes the cipher seem more complicated than it is, but it’s really just a
concise way of expressing the algorithm precisely.

---

Enough background. The examples will help:

```bash
$ ruby caesar.rb
Key: 3
plaintext: CODEABLE
ciphertext: FRGHDEOH
$
```

First, the program asks the user for a `key`(in the same line). The key could be
any non-negative number.

Then the program asks the user for a `plaintext`(also in the same line).

Finally, the program computes the ciphertext and is displayed in the terminal.

In this example the key was 3 so every letter of the plaintext shift (or rotate) 3 position on the alphabet:

- C -> D, E, **F**
- O -> P, Q, **R**
- D -> E, F, **G**

You get the idea. If the key is 3 and a letter is Y -> Z, A, **B** (start over
from A when you reach Z).

Another example:

```bash
$ ruby caesar.rb
Key: 3
plaintext: Codeable 2021!!!
ciphertext: Frghdeoh 2021!!!
$
```

Notice how the casing is respected from plaintext to ciphertext (upper case and
lower case). Also, notice that the only letters that change is alphabetical,
numbers and symbols do not change.

> You can assume that the user will give you a valid positive number for the
> key. No need to validate that.

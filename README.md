# Gilded Rose Refactoring Kata

This repo contains my code for the Gilded Rose Refactoring Kata, in Ruby, and using Rspec for testing. This was done as part of the Makers Academy Course, October 2019 cohort, in Week 10 (Tech Tests). 

The approach was firstly to write tests for all pre-existing behaviours and ensure they pass. The next step is to refactor the existing code to be clearer, whilst retaining all functionality. 

Whilst writing the tests, I made sure to order them in the same order as the documentation. For the specific items that had different rules (such as the Aged Brie) I used a separate 'describe' block for clarity. 

To run the tests, simple enter ```rspec``` into the command line. Results will show as follows:

```
GildedRose
  #update_quality
    does not change the name
    lowers sell_in and quality by 1 each day
    degrades quality twice as fast after the sell by date
    does not decrease quality below 0
    does not increase quality beyond 50
    Aged Brie
      increases the quality of Aged Brie over time
    Sulfuras, Hand of Ragnaros
      does not decrease the quality of Sulfuras
    Backstage passes
      Quality increases by 2 when there are less than 10 days to the concert
      Quality increases by 3 when there are less than 5 days to the concert
      Quality drops to zero after the concert
      Quality cannot increase over 50

11 examples, 0 failures
```

## (Original author Emily Bache, text from her original README below):

This Kata was originally created by Terry Hughes (http://twitter.com/TerryHughes). It is already on GitHub [here](https://github.com/NotMyself/GildedRose). See also [Bobby Johnson's description of the kata](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

I translated the original C# into a few other languages, (with a little help from my friends!), and slightly changed the starting position. This means I've actually done a small amount of refactoring already compared with the original form of the kata, and made it easier to get going with writing tests by giving you one failing unit test to start with. I also added test fixtures for Text-Based approval testing with TextTest (see [the TextTests](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/texttests))

As Bobby Johnson points out in his article ["Why Most Solutions to Gilded Rose Miss The Bigger Picture"](http://iamnotmyself.com/2012/12/07/why-most-solutions-to-gilded-rose-miss-the-bigger-picture), it'll actually give you
better practice at handling a legacy code situation if you do this Kata in the original C#. However, I think this kata
is also really useful for practicing writing good tests using different frameworks and approaches, and the small changes I've made help with that. I think it's also interesting to compare what the refactored code and tests look like in different programming languages.

I wrote this article ["Writing Good Tests for the Gilded Rose Kata"](http://coding-is-like-cooking.info/2013/03/writing-good-tests-for-the-gilded-rose-kata/) about how you could use this kata in a [coding dojo](https://leanpub.com/codingdojohandbook).

## How to use this Kata

The simplest way is to just clone the code and start hacking away improving the design. You'll want to look at the ["Gilded Rose Requirements"](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/GildedRoseRequirements.txt) which explains what the code is for. I strongly advise you that you'll also need some tests if you want to make sure you don't break the code while you refactor.

You could write some unit tests yourself, using the requirements to identify suitable test cases. I've provided a failing unit test in a popular test framework as a starting point for most languages.

Alternatively, use the "Text-Based" tests provided in this repository. (Read more about that in the next section)

Whichever testing approach you choose, the idea of the exercise is to do some deliberate practice, and improve your skills at designing test cases and refactoring. The idea is not to re-write the code from scratch, but rather to practice designing tests, taking small steps, running the tests often, and incrementally improving the design. 


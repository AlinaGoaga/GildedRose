# Gilded rose tech test   <a href="https://codeclimate.com/github/AlinaGoaga/GildedRose/maintainability"><img src="https://api.codeclimate.com/v1/badges/62eee2ff725bfeaec39c/maintainability" /></a>

## My approach

- first ```interacted with the app via irb``` to understand exactly how the code works
- ```wrote tests``` before starting the refactoring (coverage: 97%)
- ```refactored slowly```, extracting products from the code
- I initially kept all the methods in the same file after which they got split into ```different files each handling a different class of objects``` (ticket, brie, normal, sulfuras)
- used the ```ternary operator``` whenever possible to make the IF statements easier to read
- the individual product classes ```inherit``` from the Item class
- as I went through the refactoring, ```after making a change I'd run the tests to make sure the code still worked```
- once I had reached a stage when I had working code split in classes which handled items, I continued to refactor to ```improve readability```

## Usage and testing


## About the kata

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

* All items have a SellIn value which denotes the number of days we have to sell the item.
* All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item.

Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, Quality degrades twice as fast 
* The Quality of an item is never negative
* “Aged Brie” actually increases in Quality the older it gets
* The Quality of an item is never more than 50
* “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
* “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal Items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you).

### Legacy code

![Gilded Rose](https://github.com/AlinaGoaga/GildedRose/blob/master/images/gilded_rose.png)

### Small example of running the program in irb

![Example](https://github.com/AlinaGoaga/GildedRose/blob/master/images/gilded_rose_in_irb.jpeg)

### Tests and coverage

![Rspec output](https://github.com/AlinaGoaga/GildedRose/blob/master/images/running_rspec.jpeg)


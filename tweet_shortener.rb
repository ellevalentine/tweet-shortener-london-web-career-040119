'use strict';

var abbr_dictionary = {
	"hello" : "hi",
	"to" : "2",
	"two" : "2",
	"too" : "2",
	"be" : "b",
	"you" : "u",
	"at" : "@",
	"and" : "&",
	"for" : "4",
	"For" : "4"
};

var tweetShortener = {
 wordSubstituter: function(tweet){
   var subbed_tweet = [];
   tweet.split(" ").forEach(function(word){
   	if (abbr_dictionary[word] === undefined){
   		subbed_tweet.push(word);
   	} else {
   		subbed_tweet.push(abbr_dictionary[word]);
   	}
   });
   return subbed_tweet.join(" ");
 },
 bulkShortener: function(tweets){
 	var wordSubstituter = this.wordSubstituter;
 	var short_tweet = [];

 	tweets.forEach(function(tweet){
 		short_tweet.push(wordSubstituter(tweet));
 	});
 	return short_tweet;
 },
 selectiveShortener: function(tweet){
    var wordSubstituter = this.wordSubstituter;

    if (tweet.length > 140){
      return wordSubstituter(tweet);
    } else {
      return tweet;
    }
  },

  shortenedTruncator: function(tweet){
    var wordSubstituter = this.wordSubstituter;

    if (tweet.length > 140){
      return wordSubstituter(tweet).slice (0,137)+"...";
    } else {
      return tweet;
    }
  }
};
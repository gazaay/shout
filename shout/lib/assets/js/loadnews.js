(function () {

  "use strict";

  var app = new Framework7;
  var $$ = Dom7;
  var viewMain = app.addView('#view-main');
  var pullToRefreshPosts = $$('#content-posts');

  // When pullToRefresh is called
  pullToRefreshPosts.on('refresh', function (e) {

    // Simulation of an Ajax request for demo
    // Get posts
    $$.ajax({
      url: 'rss_reader/SCMPFeed',
      dataType: 'json',
      timeout: 5000,
      success: function(feed){
        // Save posts
        // local_posts = feed.rss.channel.item;
        // Display posts
        feed.rss.channel.item.forEach(function(post) {
          // console.log(post.title);
          $$('#post-list').append(
            '<li>'+
              '<a href="' + post.link + '">'+
                '<div class="post-thumbnail"><img src="'+post.content.url+'"></div>'+
                '<div class="post-infos">'+
                  '<div class="post-title">'+
                    '<span>'+post.title+'</span>'+
                  '</div>'+
                  // '<div class="post-category ' + post.color + '">' + post.category + '</div>'+
                  '<div class="post-date"><i class="ion-android-time"></i>' + post.pubDate + '</div>'+
                '</div>'+
              '</a>'+
            '</li>'
          );
        });
      },
      error: function(error){
        console.log('Error with the ajax call');
      }
    });
    app.pullToRefreshDone(pullToRefreshPosts);
   
  });

  var isLoading = false;

  // When infiniteScroll is called
  $$('#content-posts').on('infinite', function () {
    if (isLoading) return;
    isLoading = true;

    // Simulation of an Ajax request for demo
    setTimeout(function(){
      $$('#post-list').append(
        '<li>'+
          '<a href="post.html">'+
            '<div class="post-thumbnail"><img src="img/thumbnails/image11.jpg"></div>'+
            '<div class="post-infos">'+
              '<div class="post-title"><span>Ut enim ad minim veniam, quis nostrud</span></div>'+
              '<div class="post-category green">Business</div>'+
              '<div class="post-date"><i class="icon ion-android-time"></i>12 minutes ago</div>'+
            '</div>'+
          '</a>'+
        '</li>'+
        '<li>'+
          '<a href="post.html">'+
            '<div class="post-thumbnail"><img src="img/thumbnails/image12.jpg"></div>'+
            '<div class="post-infos">'+
              '<div class="post-title"><span>Laboris nisi ut aliquip ex commodo tincidunt</span></div>'+
              '<div class="post-category yellow">Sports</div>'+
              '<div class="post-date"><i class="icon ion-android-time"></i>12 minutes ago</div>'+
            '</div>'+
          '</a>'+
        '</li>'+
        '<li>'+
          '<a href="post.html">'+
            '<div class="post-thumbnail"><img src="img/thumbnails/image13.jpg"></div>'+
            '<div class="post-infos">'+
              '<div class="post-title"><span>Donec consectetuer ligula vulputate sem tristique cursus</span></div>'+
              '<div class="post-category blue">Fashion</div>'+
              '<div class="post-date"><i class="icon ion-android-time"></i>12 minutes ago</div>'+
            '</div>'+
          '</a>'+
        '</li>'
      );
      $$('#infinite-loader').remove();
      isLoading = false;
    }, 2000);

  });

  // When a post is opened
  app.onPageInit('post', function(page){
    $$('#view-main .back-hidden').toggleClass('back-hidden back-visible');
  });

  // When back arrow is clicked
  app.onPageBack('post', function(e){
    $$('#view-main .back-visible').toggleClass('back-hidden back-visible');
  });

}());

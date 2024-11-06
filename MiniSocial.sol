// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    // Event declaration
    event NewPostEvent(string message, address postOwner, uint postTime, uint postId);

    struct Comment {
        address author;
        string content;
        uint num_likes_com;
        bool exists;
    }

    struct Post {
        uint id;
        string message;
        address author;
        uint likeCount;
        uint commentCount;
        bool exists;
    }

    Post[] public posts;
    mapping(uint => mapping(address => bool)) public postLikes;
    mapping(uint => Comment[]) public postComments;
    mapping(uint => mapping(uint => mapping(address => bool))) public commentLikes;

    // Function to publish a post
    function publishPost(string memory _message) public {
        require(bytes(_message).length > 0, "Post cannot be empty.");
        require(bytes(_message).length <= 140, "Post is too long.");

        uint postId = posts.length;
        Post memory newPost = Post(postId, _message, msg.sender, 0, 0, true);
        posts.push(newPost);

        // Emitting the event with the new post details
        emit NewPostEvent(_message, msg.sender, block.timestamp, postId);
    }

    // Function to like or unlike a post
    function likePost(uint postId) public {
        require(postId < posts.length, "Post does not exist.");
        require(posts[postId].exists, "Post is inactive.");

        if (postLikes[postId][msg.sender]) {
            // If already liked, unlike it
            postLikes[postId][msg.sender] = false;
            posts[postId].likeCount--;
        } else {
            // If not liked, like it
            postLikes[postId][msg.sender] = true;
            posts[postId].likeCount++;
        }
    }

    // Function to add a comment to a post
    function addComment(uint postId, string memory _content) public {
        require(postId < posts.length, "Post does not exist.");
        require(posts[postId].exists, "Post is inactive.");
        require(bytes(_content).length > 0, "Comment cannot be empty.");

        Comment memory newComment = Comment(msg.sender, _content, 0, true);
        postComments[postId].push(newComment);
        posts[postId].commentCount++;
    }

    // Function to like or unlike a comment
    function likeComment(uint postId, uint commentId) public {
        require(postId < posts.length, "Post does not exist.");
        require(posts[postId].exists, "Post is inactive.");
        require(commentId < postComments[postId].length, "Comment does not exist.");
        require(postComments[postId][commentId].exists, "Comment is inactive.");

        if (commentLikes[postId][commentId][msg.sender]) {
            // If already liked, unlike it
            commentLikes[postId][commentId][msg.sender] = false;
            postComments[postId][commentId].num_likes_com--;
        } else {
            // If not liked, like it
            commentLikes[postId][commentId][msg.sender] = true;
            postComments[postId][commentId].num_likes_com++;
        }
    }

    // Function to delete a post
    function deletePost(uint postId) public {
        require(postId < posts.length, "Post does not exist.");
        require(posts[postId].author == msg.sender, "Only the author can delete the post.");
        posts[postId].exists = false;
        posts[postId].likeCount = 0;
        posts[postId].commentCount = 0;
    }

    // Function to delete a comment
    function deleteComment(uint postId, uint commentId) public {
        require(postId < posts.length, "Post does not exist.");
        require(commentId < postComments[postId].length, "Comment does not exist.");
        require(postComments[postId][commentId].author == msg.sender, "Only the author can delete the comment.");
        postComments[postId][commentId].exists = false;
        postComments[postId][commentId].num_likes_com = 0;
    }

    // Function to get total number of posts
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }

    // Function to retrieve a specific post
    function getPost(uint postId) public view returns (string memory, address, uint, uint, bool) {
        require(postId < posts.length, "Post does not exist.");
        Post memory post = posts[postId];
        return (post.message, post.author, post.likeCount, post.commentCount, post.exists);
    }

    // Function to retrieve a specific comment
    function getComment(uint postId, uint commentId) public view returns (string memory, address, uint, bool) {
        require(postId < posts.length, "Post does not exist.");
        require(commentId < postComments[postId].length, "Comment does not exist.");
        Comment memory comment = postComments[postId][commentId];
        return (comment.content, comment.author, comment.num_likes_com, comment.exists);
    }

    // Function to get the total number of comments for a specific post
    function getCommentCount(uint postId) public view returns (uint) {
        require(postId < posts.length, "Post does not exist.");
        return posts[postId].commentCount;
    }
}

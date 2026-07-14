package com.mf.response;

import com.mf.model.PostQueries;
import com.mf.model.PostQueriesAssign;




public class AnsweredPostQueries 
{
	public PostQueries postQueries;
	public PostQueriesAssign postQueriesAssign;

	public PostQueries getPostQueries() {
		return postQueries;
	}

	public void setPostQueries(PostQueries postQueries) {
		this.postQueries = postQueries;
	}

	public PostQueriesAssign getPostQueriesAssign() {
		return postQueriesAssign;
	}

	public void setPostQueriesAssign(PostQueriesAssign postQueriesAssign) {
		this.postQueriesAssign = postQueriesAssign;
	}
}

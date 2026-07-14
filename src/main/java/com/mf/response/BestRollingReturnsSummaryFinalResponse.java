package com.mf.response;

import java.util.Date;
import java.util.List;

import com.mf.amfi.response.QuartileRankingResponse;

public class BestRollingReturnsSummaryFinalResponse {

	private String scheme_name;
	private Double minimum;
	private Double maximum;
	private Double average;
	private Double median;
	private Double less_than_0;
	private Double less_than_5;
	private Double less_than_10;
	private Double less_than_15;
	private Double less_than_20;
	private Double greater_than_20;
	private Integer category_flag;
	private Double std_dev;
	private String scheme_inception_date;
	private Double scheme_assets;
	List<QuartileRankingResponse> list;
	private Double returns;
	private Integer rank_value;
	private String returns_rank;
	private Integer performance_score;
	private Double beat_percentage;
	private Integer count_returns;
	private String combined_performance;
	private Integer combined_performance_order;
	
	private Double expense_ratio;
	private Double one_yr_return;
	private Double three_yr_return;
	private Double five_yr_return;
	private Double ten_yr_return;
	
	private String scheme_amfi_url;
	
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public Double getMinimum() {
		return minimum;
	}
	public void setMinimum(Double minimum) {
		this.minimum = minimum;
	}
	public Double getMaximum() {
		return maximum;
	}
	public void setMaximum(Double maximum) {
		this.maximum = maximum;
	}
	public Double getAverage() {
		return average;
	}
	public void setAverage(Double average) {
		this.average = average;
	}
	public Double getMedian() {
		return median;
	}
	public void setMedian(Double median) {
		this.median = median;
	}
	public Double getLess_than_0() {
		return less_than_0;
	}
	public void setLess_than_0(Double less_than_0) {
		this.less_than_0 = less_than_0;
	}
	public Double getLess_than_5() {
		return less_than_5;
	}
	public void setLess_than_5(Double less_than_5) {
		this.less_than_5 = less_than_5;
	}
	public Double getLess_than_10() {
		return less_than_10;
	}
	public void setLess_than_10(Double less_than_10) {
		this.less_than_10 = less_than_10;
	}
	public Double getLess_than_15() {
		return less_than_15;
	}
	public void setLess_than_15(Double less_than_15) {
		this.less_than_15 = less_than_15;
	}
	public Double getLess_than_20() {
		return less_than_20;
	}
	public void setLess_than_20(Double less_than_20) {
		this.less_than_20 = less_than_20;
	}
	public Double getGreater_than_20() {
		return greater_than_20;
	}
	public void setGreater_than_20(Double greater_than_20) {
		this.greater_than_20 = greater_than_20;
	}
	public Integer getCategory_flag() {
		return category_flag;
	}
	public void setCategory_flag(Integer category_flag) {
		this.category_flag = category_flag;
	}
	public Double getStd_dev() {
		return std_dev;
	}
	public void setStd_dev(Double std_dev) {
		this.std_dev = std_dev;
	}
	public String getScheme_inception_date() {
		return scheme_inception_date;
	}
	public void setScheme_inception_date(String scheme_inception_date) {
		this.scheme_inception_date = scheme_inception_date;
	}
	public Double getScheme_assets() {
		return scheme_assets;
	}
	public void setScheme_assets(Double scheme_assets) {
		this.scheme_assets = scheme_assets;
	}
	public List<QuartileRankingResponse> getList() {
		return list;
	}
	public void setList(List<QuartileRankingResponse> list) {
		this.list = list;
	}
	public Double getReturns() {
		return returns;
	}
	public void setReturns(Double returns) {
		this.returns = returns;
	}
	public Integer getRank_value() {
		return rank_value;
	}
	public void setRank_value(Integer rank_value) {
		this.rank_value = rank_value;
	}
	public String getReturns_rank() {
		return returns_rank;
	}
	public void setReturns_rank(String returns_rank) {
		this.returns_rank = returns_rank;
	}
	public Integer getPerformance_score() {
		return performance_score;
	}
	public void setPerformance_score(Integer performance_score) {
		this.performance_score = performance_score;
	}
	public Double getBeat_percentage() {
		return beat_percentage;
	}
	public void setBeat_percentage(Double beat_percentage) {
		this.beat_percentage = beat_percentage;
	}
	public Integer getCount_returns() {
		return count_returns;
	}
	public void setCount_returns(Integer count_returns) {
		this.count_returns = count_returns;
	}
	public String getCombined_performance() {
		return combined_performance;
	}
	public void setCombined_performance(String combined_performance) {
		this.combined_performance = combined_performance;
	}
	public Integer getCombined_performance_order() {
		return combined_performance_order;
	}
	public void setCombined_performance_order(Integer combined_performance_order) {
		this.combined_performance_order = combined_performance_order;
	}
	public Double getExpense_ratio() {
		return expense_ratio;
	}
	public void setExpense_ratio(Double expense_ratio) {
		this.expense_ratio = expense_ratio;
	}
	public Double getOne_yr_return() {
		return one_yr_return;
	}
	public void setOne_yr_return(Double one_yr_return) {
		this.one_yr_return = one_yr_return;
	}
	public Double getThree_yr_return() {
		return three_yr_return;
	}
	public void setThree_yr_return(Double three_yr_return) {
		this.three_yr_return = three_yr_return;
	}
	public Double getFive_yr_return() {
		return five_yr_return;
	}
	public void setFive_yr_return(Double five_yr_return) {
		this.five_yr_return = five_yr_return;
	}
	public Double getTen_yr_return() {
		return ten_yr_return;
	}
	public void setTen_yr_return(Double ten_yr_return) {
		this.ten_yr_return = ten_yr_return;
	}
	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}	
}
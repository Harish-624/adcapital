package com.mf.amfi.model;

import java.util.Date;

import javax.persistence.Transient;

public class SchemePerformancesSip {

	private int id;
    private String scheme_name;
    private String scheme_amfi_code;
    private String scheme_amfi_short_name;
	private String scheme_category;
	private boolean dividend_scheme;
	private Date inception_date;
	private Date start_date;
	private Date end_date;
	private int period;
	private double amount;
	private double current_cost;
	private String current_cost_str;
	private double current_value;
	private String current_value_str;
	private double returns;
	private Double ter;
	private String ter_date;
	private Double scheme_assets;
	private String scheme_asset_date;
	private String scheme_company;
	
	private Integer rank_inception;
	private Integer rank_1_yr;
	private Integer rank_2_yr;
	private Integer rank_3_yr;
	private Integer rank_4_yr;
	private Integer rank_5_yr;
	private Integer rank_6_yr;
	private Integer rank_7_yr;
	private Integer rank_8_yr;
	private Integer rank_9_yr;
	private Integer rank_10_yr;
	private Integer rank_11_yr;
	private Integer rank_12_yr;
	private Integer rank_13_yr;
	private Integer rank_14_yr;
	private Integer rank_15_yr;
	private Integer rank_16_yr;
	private Integer rank_17_yr;
	private Integer rank_18_yr;
	private Integer rank_19_yr;
	private Integer rank_20_yr;
	private Integer rank_21_yr;
	private Integer rank_22_yr;
	private Integer rank_23_yr;
	private Integer rank_24_yr;
	private Integer rank_25_yr;
	
	private Integer rank_inception_total_rank;
	private Integer rank_1_yr_total_rank;
	private Integer rank_2_yr_total_rank;
	private Integer rank_3_yr_total_rank;
	private Integer rank_4_yr_total_rank;
	private Integer rank_5_yr_total_rank;
	private Integer rank_6_yr_total_rank;
	private Integer rank_7_yr_total_rank;
	private Integer rank_8_yr_total_rank;
	private Integer rank_9_yr_total_rank;
	private Integer rank_10_yr_total_rank;
	private Integer rank_11_yr_total_rank;
	private Integer rank_12_yr_total_rank;
	private Integer rank_13_yr_total_rank;
	private Integer rank_14_yr_total_rank;
	private Integer rank_15_yr_total_rank;
	private Integer rank_16_yr_total_rank;
	private Integer rank_17_yr_total_rank;
	private Integer rank_18_yr_total_rank;
	private Integer rank_19_yr_total_rank;
	private Integer rank_20_yr_total_rank;
	private Integer rank_21_yr_total_rank;
	private Integer rank_22_yr_total_rank;
	private Integer rank_23_yr_total_rank;
	private Integer rank_24_yr_total_rank;
	private Integer rank_25_yr_total_rank;
	
	private String riskometer;
	private String fund_manager;
	private String category_short_name;
	private String sub_category;
	
	@Transient
	private Double standard_deviation;
	@Transient
	private Double sharpratio;
	@Transient
	private Double average_maturity;
	@Transient
	private Double alpha;
	@Transient
	private Double beta;
	@Transient
	private Double ve_ytm;
	
	@Transient
	private String quartile_rank;

	@Transient
	private String quartile_rank_previous;	
	
	@Transient
	private Double sortino_ratio;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public Date getInception_date() {
		return inception_date;
	}
	public void setInception_date(Date inception_date) {
		this.inception_date = inception_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public double getCurrent_cost() {
		return current_cost;
	}
	public void setCurrent_cost(double current_cost) {
		this.current_cost = current_cost;
	}
	public double getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(double current_value) {
		this.current_value = current_value;
	}
	public double getReturns() {
		return returns;
	}
	public void setReturns(double returns) {
		this.returns = returns;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public boolean isDividend_scheme() {
		return dividend_scheme;
	}
	public void setDividend_scheme(boolean dividend_scheme) {
		this.dividend_scheme = dividend_scheme;
	}
	public Double getTer() {
		return ter;
	}
	public void setTer(Double ter) {
		this.ter = ter;
	}
	public String getTer_date() {
		return ter_date;
	}
	public void setTer_date(String ter_date) {
		this.ter_date = ter_date;
	}
	public Double getScheme_assets() {
		return scheme_assets;
	}
	public void setScheme_assets(Double scheme_assets) {
		this.scheme_assets = scheme_assets;
	}
	public String getScheme_asset_date() {
		return scheme_asset_date;
	}
	public void setScheme_asset_date(String scheme_asset_date) {
		this.scheme_asset_date = scheme_asset_date;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public String getScheme_amfi_short_name() {
		return scheme_amfi_short_name;
	}
	public void setScheme_amfi_short_name(String scheme_amfi_short_name) {
		this.scheme_amfi_short_name = scheme_amfi_short_name;
	}
	public String getScheme_company() {
		return scheme_company;
	}
	public void setScheme_company(String scheme_company) {
		this.scheme_company = scheme_company;
	}
	public Integer getRank_inception() {
		return rank_inception;
	}
	public void setRank_inception(Integer rank_inception) {
		this.rank_inception = rank_inception;
	}
	public Integer getRank_1_yr() {
		return rank_1_yr;
	}
	public void setRank_1_yr(Integer rank_1_yr) {
		this.rank_1_yr = rank_1_yr;
	}
	public Integer getRank_2_yr() {
		return rank_2_yr;
	}
	public void setRank_2_yr(Integer rank_2_yr) {
		this.rank_2_yr = rank_2_yr;
	}
	public Integer getRank_3_yr() {
		return rank_3_yr;
	}
	public void setRank_3_yr(Integer rank_3_yr) {
		this.rank_3_yr = rank_3_yr;
	}
	public Integer getRank_4_yr() {
		return rank_4_yr;
	}
	public void setRank_4_yr(Integer rank_4_yr) {
		this.rank_4_yr = rank_4_yr;
	}
	public Integer getRank_5_yr() {
		return rank_5_yr;
	}
	public void setRank_5_yr(Integer rank_5_yr) {
		this.rank_5_yr = rank_5_yr;
	}
	public Integer getRank_6_yr() {
		return rank_6_yr;
	}
	public void setRank_6_yr(Integer rank_6_yr) {
		this.rank_6_yr = rank_6_yr;
	}
	public Integer getRank_7_yr() {
		return rank_7_yr;
	}
	public void setRank_7_yr(Integer rank_7_yr) {
		this.rank_7_yr = rank_7_yr;
	}
	public Integer getRank_8_yr() {
		return rank_8_yr;
	}
	public void setRank_8_yr(Integer rank_8_yr) {
		this.rank_8_yr = rank_8_yr;
	}
	public Integer getRank_9_yr() {
		return rank_9_yr;
	}
	public void setRank_9_yr(Integer rank_9_yr) {
		this.rank_9_yr = rank_9_yr;
	}
	public Integer getRank_10_yr() {
		return rank_10_yr;
	}
	public void setRank_10_yr(Integer rank_10_yr) {
		this.rank_10_yr = rank_10_yr;
	}
	public Integer getRank_11_yr() {
		return rank_11_yr;
	}
	public void setRank_11_yr(Integer rank_11_yr) {
		this.rank_11_yr = rank_11_yr;
	}
	public Integer getRank_12_yr() {
		return rank_12_yr;
	}
	public void setRank_12_yr(Integer rank_12_yr) {
		this.rank_12_yr = rank_12_yr;
	}
	public Integer getRank_13_yr() {
		return rank_13_yr;
	}
	public void setRank_13_yr(Integer rank_13_yr) {
		this.rank_13_yr = rank_13_yr;
	}
	public Integer getRank_14_yr() {
		return rank_14_yr;
	}
	public void setRank_14_yr(Integer rank_14_yr) {
		this.rank_14_yr = rank_14_yr;
	}
	public Integer getRank_15_yr() {
		return rank_15_yr;
	}
	public void setRank_15_yr(Integer rank_15_yr) {
		this.rank_15_yr = rank_15_yr;
	}
	public Integer getRank_16_yr() {
		return rank_16_yr;
	}
	public void setRank_16_yr(Integer rank_16_yr) {
		this.rank_16_yr = rank_16_yr;
	}
	public Integer getRank_17_yr() {
		return rank_17_yr;
	}
	public void setRank_17_yr(Integer rank_17_yr) {
		this.rank_17_yr = rank_17_yr;
	}
	public Integer getRank_18_yr() {
		return rank_18_yr;
	}
	public void setRank_18_yr(Integer rank_18_yr) {
		this.rank_18_yr = rank_18_yr;
	}
	public Integer getRank_19_yr() {
		return rank_19_yr;
	}
	public void setRank_19_yr(Integer rank_19_yr) {
		this.rank_19_yr = rank_19_yr;
	}
	public Integer getRank_20_yr() {
		return rank_20_yr;
	}
	public void setRank_20_yr(Integer rank_20_yr) {
		this.rank_20_yr = rank_20_yr;
	}
	public Integer getRank_21_yr() {
		return rank_21_yr;
	}
	public void setRank_21_yr(Integer rank_21_yr) {
		this.rank_21_yr = rank_21_yr;
	}
	public Integer getRank_22_yr() {
		return rank_22_yr;
	}
	public void setRank_22_yr(Integer rank_22_yr) {
		this.rank_22_yr = rank_22_yr;
	}
	public Integer getRank_23_yr() {
		return rank_23_yr;
	}
	public void setRank_23_yr(Integer rank_23_yr) {
		this.rank_23_yr = rank_23_yr;
	}
	public Integer getRank_24_yr() {
		return rank_24_yr;
	}
	public void setRank_24_yr(Integer rank_24_yr) {
		this.rank_24_yr = rank_24_yr;
	}
	public Integer getRank_25_yr() {
		return rank_25_yr;
	}
	public void setRank_25_yr(Integer rank_25_yr) {
		this.rank_25_yr = rank_25_yr;
	}
	public Integer getRank_inception_total_rank() {
		return rank_inception_total_rank;
	}
	public void setRank_inception_total_rank(Integer rank_inception_total_rank) {
		this.rank_inception_total_rank = rank_inception_total_rank;
	}
	public Integer getRank_1_yr_total_rank() {
		return rank_1_yr_total_rank;
	}
	public void setRank_1_yr_total_rank(Integer rank_1_yr_total_rank) {
		this.rank_1_yr_total_rank = rank_1_yr_total_rank;
	}
	public Integer getRank_2_yr_total_rank() {
		return rank_2_yr_total_rank;
	}
	public void setRank_2_yr_total_rank(Integer rank_2_yr_total_rank) {
		this.rank_2_yr_total_rank = rank_2_yr_total_rank;
	}
	public Integer getRank_3_yr_total_rank() {
		return rank_3_yr_total_rank;
	}
	public void setRank_3_yr_total_rank(Integer rank_3_yr_total_rank) {
		this.rank_3_yr_total_rank = rank_3_yr_total_rank;
	}
	public Integer getRank_4_yr_total_rank() {
		return rank_4_yr_total_rank;
	}
	public void setRank_4_yr_total_rank(Integer rank_4_yr_total_rank) {
		this.rank_4_yr_total_rank = rank_4_yr_total_rank;
	}
	public Integer getRank_5_yr_total_rank() {
		return rank_5_yr_total_rank;
	}
	public void setRank_5_yr_total_rank(Integer rank_5_yr_total_rank) {
		this.rank_5_yr_total_rank = rank_5_yr_total_rank;
	}
	public Integer getRank_6_yr_total_rank() {
		return rank_6_yr_total_rank;
	}
	public void setRank_6_yr_total_rank(Integer rank_6_yr_total_rank) {
		this.rank_6_yr_total_rank = rank_6_yr_total_rank;
	}
	public Integer getRank_7_yr_total_rank() {
		return rank_7_yr_total_rank;
	}
	public void setRank_7_yr_total_rank(Integer rank_7_yr_total_rank) {
		this.rank_7_yr_total_rank = rank_7_yr_total_rank;
	}
	public Integer getRank_8_yr_total_rank() {
		return rank_8_yr_total_rank;
	}
	public void setRank_8_yr_total_rank(Integer rank_8_yr_total_rank) {
		this.rank_8_yr_total_rank = rank_8_yr_total_rank;
	}
	public Integer getRank_9_yr_total_rank() {
		return rank_9_yr_total_rank;
	}
	public void setRank_9_yr_total_rank(Integer rank_9_yr_total_rank) {
		this.rank_9_yr_total_rank = rank_9_yr_total_rank;
	}
	public Integer getRank_10_yr_total_rank() {
		return rank_10_yr_total_rank;
	}
	public void setRank_10_yr_total_rank(Integer rank_10_yr_total_rank) {
		this.rank_10_yr_total_rank = rank_10_yr_total_rank;
	}
	public Integer getRank_11_yr_total_rank() {
		return rank_11_yr_total_rank;
	}
	public void setRank_11_yr_total_rank(Integer rank_11_yr_total_rank) {
		this.rank_11_yr_total_rank = rank_11_yr_total_rank;
	}
	public Integer getRank_12_yr_total_rank() {
		return rank_12_yr_total_rank;
	}
	public void setRank_12_yr_total_rank(Integer rank_12_yr_total_rank) {
		this.rank_12_yr_total_rank = rank_12_yr_total_rank;
	}
	public Integer getRank_13_yr_total_rank() {
		return rank_13_yr_total_rank;
	}
	public void setRank_13_yr_total_rank(Integer rank_13_yr_total_rank) {
		this.rank_13_yr_total_rank = rank_13_yr_total_rank;
	}
	public Integer getRank_14_yr_total_rank() {
		return rank_14_yr_total_rank;
	}
	public void setRank_14_yr_total_rank(Integer rank_14_yr_total_rank) {
		this.rank_14_yr_total_rank = rank_14_yr_total_rank;
	}
	public Integer getRank_15_yr_total_rank() {
		return rank_15_yr_total_rank;
	}
	public void setRank_15_yr_total_rank(Integer rank_15_yr_total_rank) {
		this.rank_15_yr_total_rank = rank_15_yr_total_rank;
	}
	public Integer getRank_16_yr_total_rank() {
		return rank_16_yr_total_rank;
	}
	public void setRank_16_yr_total_rank(Integer rank_16_yr_total_rank) {
		this.rank_16_yr_total_rank = rank_16_yr_total_rank;
	}
	public Integer getRank_17_yr_total_rank() {
		return rank_17_yr_total_rank;
	}
	public void setRank_17_yr_total_rank(Integer rank_17_yr_total_rank) {
		this.rank_17_yr_total_rank = rank_17_yr_total_rank;
	}
	public Integer getRank_18_yr_total_rank() {
		return rank_18_yr_total_rank;
	}
	public void setRank_18_yr_total_rank(Integer rank_18_yr_total_rank) {
		this.rank_18_yr_total_rank = rank_18_yr_total_rank;
	}
	public Integer getRank_19_yr_total_rank() {
		return rank_19_yr_total_rank;
	}
	public void setRank_19_yr_total_rank(Integer rank_19_yr_total_rank) {
		this.rank_19_yr_total_rank = rank_19_yr_total_rank;
	}
	public Integer getRank_20_yr_total_rank() {
		return rank_20_yr_total_rank;
	}
	public void setRank_20_yr_total_rank(Integer rank_20_yr_total_rank) {
		this.rank_20_yr_total_rank = rank_20_yr_total_rank;
	}
	public Integer getRank_21_yr_total_rank() {
		return rank_21_yr_total_rank;
	}
	public void setRank_21_yr_total_rank(Integer rank_21_yr_total_rank) {
		this.rank_21_yr_total_rank = rank_21_yr_total_rank;
	}
	public Integer getRank_22_yr_total_rank() {
		return rank_22_yr_total_rank;
	}
	public void setRank_22_yr_total_rank(Integer rank_22_yr_total_rank) {
		this.rank_22_yr_total_rank = rank_22_yr_total_rank;
	}
	public Integer getRank_23_yr_total_rank() {
		return rank_23_yr_total_rank;
	}
	public void setRank_23_yr_total_rank(Integer rank_23_yr_total_rank) {
		this.rank_23_yr_total_rank = rank_23_yr_total_rank;
	}
	public Integer getRank_24_yr_total_rank() {
		return rank_24_yr_total_rank;
	}
	public void setRank_24_yr_total_rank(Integer rank_24_yr_total_rank) {
		this.rank_24_yr_total_rank = rank_24_yr_total_rank;
	}
	public Integer getRank_25_yr_total_rank() {
		return rank_25_yr_total_rank;
	}
	public void setRank_25_yr_total_rank(Integer rank_25_yr_total_rank) {
		this.rank_25_yr_total_rank = rank_25_yr_total_rank;
	}
	public String getRiskometer() {
		return riskometer;
	}
	public void setRiskometer(String riskometer) {
		this.riskometer = riskometer;
	}
	public String getFund_manager() {
		return fund_manager;
	}
	public void setFund_manager(String fund_manager) {
		this.fund_manager = fund_manager;
	}
	public String getCategory_short_name() {
		return category_short_name;
	}
	public void setCategory_short_name(String category_short_name) {
		this.category_short_name = category_short_name;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public Double getStandard_deviation() {
		return standard_deviation;
	}
	public void setStandard_deviation(Double standard_deviation) {
		this.standard_deviation = standard_deviation;
	}
	public Double getSharpratio() {
		return sharpratio;
	}
	public void setSharpratio(Double sharpratio) {
		this.sharpratio = sharpratio;
	}
	public Double getAverage_maturity() {
		return average_maturity;
	}
	public void setAverage_maturity(Double average_maturity) {
		this.average_maturity = average_maturity;
	}
	public Double getAlpha() {
		return alpha;
	}
	public void setAlpha(Double alpha) {
		this.alpha = alpha;
	}
	public Double getBeta() {
		return beta;
	}
	public void setBeta(Double beta) {
		this.beta = beta;
	}
	public Double getVe_ytm() {
		return ve_ytm;
	}
	public void setVe_ytm(Double ve_ytm) {
		this.ve_ytm = ve_ytm;
	}
	public String getQuartile_rank() {
		return quartile_rank;
	}
	public void setQuartile_rank(String quartile_rank) {
		this.quartile_rank = quartile_rank;
	}
	public String getQuartile_rank_previous() {
		return quartile_rank_previous;
	}
	public void setQuartile_rank_previous(String quartile_rank_previous) {
		this.quartile_rank_previous = quartile_rank_previous;
	}
	public Double getSortino_ratio() {
		return sortino_ratio;
	}
	public void setSortino_ratio(Double sortino_ratio) {
		this.sortino_ratio = sortino_ratio;
	}
	public String getCurrent_cost_str() {
		return current_cost_str;
	}
	public void setCurrent_cost_str(String current_cost_str) {
		this.current_cost_str = current_cost_str;
	}
	public String getCurrent_value_str() {
		return current_value_str;
	}
	public void setCurrent_value_str(String current_value_str) {
		this.current_value_str = current_value_str;
	}	
}
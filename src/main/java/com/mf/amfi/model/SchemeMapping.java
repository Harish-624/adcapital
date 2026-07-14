package com.mf.amfi.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scheme_mapping")
public class SchemeMapping {

	private Integer id;
	private String scheme_company;
	private String scheme_advisorkhoj_category;
	private String scheme_broad_category;
	private String scheme_category_class;
	private String scheme_sub_category;
	private String tax_category;
	private String scheme_amfi_code;
	private String scheme_amfi_growth_code;
	private String scheme_amfi;
	private String scheme_amfi_short_name;
	private String scheme_amfi_common;
	private Boolean erstwhile_scheme_merged;
	private String erstwhile_name;
	private String scheme_cams;
	private String scheme_karvy;
	private String isin_no;
	private String isin_divreinvst_no;
	private String isin_sweep_no;
	private Boolean active;
	private Date scheme_inception_date;
	private Date scheme_maturity_date;
	private String open_or_closed;
	private String scheme_objective;
	private Integer sip_minimum_amount;
	private String sip_dates;
	private String riskometer;
	private Boolean dividend_scheme;
	private String dividend_type;
	private String url;
	private String scheme_amfi_url;
	private Double volatility = 0.0;
	private Double sharpratio = 0.0;
	private Double mean = 0.0;
	private Double standard_deviation = 0.0;
	private Double sortino_ratio = 0.0;	
	private Double alpha = 0.0;
	private Double beta = 0.0;
	private Double R2 = 0.0;
	private Double yield_to_maturity = 0.0;
	private Double average_maturity  = 0.0;
	private Double modified_duration = 0.0;
	private String scheme_benchmark;
	private String scheme_benchmark_code;
	private String scheme_benchmark_advisorkhoj;
	private String scheme_benchmark_advisorkhoj_code;
	private String scheme_asset_date;
	private Double scheme_assets;
	private Double ter;
	private String ter_date;
	private String scheme_manager;
	private String scheme_manager_biography;
	private String asset_class;
	private Double minimum;
	private Double minimum_topup;
	private String portfolio_turnover_ratio;
	private String portfolio_turnover_ratio_date;
	private String exit1;
	private String exit2;
	private String exit3;
	private String exit4;
	private String exit5;
	
	private String scheme_cams_productcode;
	private String scheme_karvy_productcode;
	
	private Double market_cap_largecap_percent;	
	private Double market_cap_midcap_percent;	
	private Double market_cap_smallcap_percent;
	private Double ve_ytm;
	
	private Integer etf_scheme;
	private String scheme_company_short_name;
	private String category_short_name;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getScheme_company() {
		return scheme_company;
	}
	public void setScheme_company(String scheme_company) {
		this.scheme_company = scheme_company;
	}
	public String getScheme_advisorkhoj_category() {
		return scheme_advisorkhoj_category;
	}
	public void setScheme_advisorkhoj_category(String scheme_advisorkhoj_category) {
		this.scheme_advisorkhoj_category = scheme_advisorkhoj_category;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public String getScheme_amfi() {
		return scheme_amfi;
	}
	public void setScheme_amfi(String scheme_amfi) {
		this.scheme_amfi = scheme_amfi;
	}
	public String getScheme_cams() {
		return scheme_cams;
	}
	public void setScheme_cams(String scheme_cams) {
		this.scheme_cams = scheme_cams;
	}
	public String getScheme_karvy() {
		return scheme_karvy;
	}
	public void setScheme_karvy(String scheme_karvy) {
		this.scheme_karvy = scheme_karvy;
	}
	public String getIsin_no() {
		return isin_no;
	}
	public void setIsin_no(String isin_no) {
		this.isin_no = isin_no;
	}
	public String getIsin_divreinvst_no() {
		return isin_divreinvst_no;
	}
	public void setIsin_divreinvst_no(String isin_divreinvst_no) {
		this.isin_divreinvst_no = isin_divreinvst_no;
	}
	public String getIsin_sweep_no() {
		return isin_sweep_no;
	}
	public void setIsin_sweep_no(String isin_sweep_no) {
		this.isin_sweep_no = isin_sweep_no;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public Date getScheme_inception_date() {
		return scheme_inception_date;
	}
	public void setScheme_inception_date(Date scheme_inception_date) {
		this.scheme_inception_date = scheme_inception_date;
	}
	public String getOpen_or_closed() {
		return open_or_closed;
	}
	public void setOpen_or_closed(String open_or_closed) {
		this.open_or_closed = open_or_closed;
	}
	public String getScheme_objective() {
		return scheme_objective;
	}
	public void setScheme_objective(String scheme_objective) {
		this.scheme_objective = scheme_objective;
	}
	public Integer getSip_minimum_amount() {
		return sip_minimum_amount;
	}
	public void setSip_minimum_amount(Integer sip_minimum_amount) {
		this.sip_minimum_amount = sip_minimum_amount;
	}
	public String getSip_dates() {
		return sip_dates;
	}
	public void setSip_dates(String sip_dates) {
		this.sip_dates = sip_dates;
	}
	public String getRiskometer() {
		return riskometer;
	}
	public void setRiskometer(String riskometer) {
		this.riskometer = riskometer;
	}
	public Boolean getDividend_scheme() {
		return dividend_scheme;
	}
	public void setDividend_scheme(Boolean dividend_scheme) {
		this.dividend_scheme = dividend_scheme;
	}
	public String getDividend_type() {
		return dividend_type;
	}
	public void setDividend_type(String dividend_type) {
		this.dividend_type = dividend_type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Double getVolatility() {
		return volatility;
	}
	public void setVolatility(Double volatility) {
		this.volatility = volatility;
	}
	public Double getSharpratio() {
		return sharpratio;
	}
	public void setSharpratio(Double sharpratio) {
		this.sharpratio = sharpratio;
	}
	public Double getMean() {
		return mean;
	}
	public void setMean(Double mean) {
		this.mean = mean;
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
	public Double getR2() {
		return R2;
	}
	public void setR2(Double r2) {
		R2 = r2;
	}
	public Double getYield_to_maturity() {
		return yield_to_maturity;
	}
	public void setYield_to_maturity(Double yield_to_maturity) {
		this.yield_to_maturity = yield_to_maturity;
	}
	public Double getAverage_maturity() {
		return average_maturity;
	}
	public void setAverage_maturity(Double average_maturity) {
		this.average_maturity = average_maturity;
	}
	public String getScheme_benchmark() {
		return scheme_benchmark;
	}
	public void setScheme_benchmark(String scheme_benchmark) {
		this.scheme_benchmark = scheme_benchmark;
	}
	public String getScheme_benchmark_code() {
		return scheme_benchmark_code;
	}
	public void setScheme_benchmark_code(String scheme_benchmark_code) {
		this.scheme_benchmark_code = scheme_benchmark_code;
	}
	public String getScheme_asset_date() {
		return scheme_asset_date;
	}
	public void setScheme_asset_date(String scheme_asset_date) {
		this.scheme_asset_date = scheme_asset_date;
	}
	public Double getScheme_assets() {
		return scheme_assets;
	}
	public void setScheme_assets(Double scheme_assets) {
		this.scheme_assets = scheme_assets;
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
	public String getScheme_manager() {
		return scheme_manager;
	}
	public void setScheme_manager(String scheme_manager) {
		this.scheme_manager = scheme_manager;
	}
	public String getScheme_manager_biography() {
		return scheme_manager_biography;
	}
	public void setScheme_manager_biography(String scheme_manager_biography) {
		this.scheme_manager_biography = scheme_manager_biography;
	}
	public String getAsset_class() {
		return asset_class;
	}
	public void setAsset_class(String asset_class) {
		this.asset_class = asset_class;
	}
	public Double getMinimum() {
		return minimum;
	}
	public void setMinimum(Double minimum) {
		this.minimum = minimum;
	}
	public Double getMinimum_topup() {
		return minimum_topup;
	}
	public void setMinimum_topup(Double minimum_topup) {
		this.minimum_topup = minimum_topup;
	}
	public String getPortfolio_turnover_ratio() {
		return portfolio_turnover_ratio;
	}
	public void setPortfolio_turnover_ratio(String portfolio_turnover_ratio) {
		this.portfolio_turnover_ratio = portfolio_turnover_ratio;
	}
	public String getPortfolio_turnover_ratio_date() {
		return portfolio_turnover_ratio_date;
	}
	public void setPortfolio_turnover_ratio_date(String portfolio_turnover_ratio_date) {
		this.portfolio_turnover_ratio_date = portfolio_turnover_ratio_date;
	}
	public String getScheme_amfi_growth_code() {
		return scheme_amfi_growth_code;
	}
	public void setScheme_amfi_growth_code(String scheme_amfi_growth_code) {
		this.scheme_amfi_growth_code = scheme_amfi_growth_code;
	}
	public String getScheme_broad_category() {
		return scheme_broad_category;
	}
	public void setScheme_broad_category(String scheme_broad_category) {
		this.scheme_broad_category = scheme_broad_category;
	}
	public String getTax_category() {
		return tax_category;
	}
	public void setTax_category(String tax_category) {
		this.tax_category = tax_category;
	}
	public String getScheme_amfi_common() {
		return scheme_amfi_common;
	}
	public void setScheme_amfi_common(String scheme_amfi_common) {
		this.scheme_amfi_common = scheme_amfi_common;
	}
	public String getScheme_cams_productcode() {
		return scheme_cams_productcode;
	}
	public void setScheme_cams_productcode(String scheme_cams_productcode) {
		this.scheme_cams_productcode = scheme_cams_productcode;
	}
	public String getScheme_karvy_productcode() {
		return scheme_karvy_productcode;
	}
	public void setScheme_karvy_productcode(String scheme_karvy_productcode) {
		this.scheme_karvy_productcode = scheme_karvy_productcode;
	}
	public Date getScheme_maturity_date() {
		return scheme_maturity_date;
	}
	public void setScheme_maturity_date(Date scheme_maturity_date) {
		this.scheme_maturity_date = scheme_maturity_date;
	}
	public String getScheme_category_class() {
		return scheme_category_class;
	}
	public void setScheme_category_class(String scheme_category_class) {
		this.scheme_category_class = scheme_category_class;
	}
	public String getScheme_sub_category() {
		return scheme_sub_category;
	}
	public void setScheme_sub_category(String scheme_sub_category) {
		this.scheme_sub_category = scheme_sub_category;
	}
	public String getExit1() {
		return exit1;
	}
	public void setExit1(String exit1) {
		this.exit1 = exit1;
	}
	public String getExit2() {
		return exit2;
	}
	public void setExit2(String exit2) {
		this.exit2 = exit2;
	}
	public String getExit3() {
		return exit3;
	}
	public void setExit3(String exit3) {
		this.exit3 = exit3;
	}
	public String getExit4() {
		return exit4;
	}
	public void setExit4(String exit4) {
		this.exit4 = exit4;
	}
	public String getExit5() {
		return exit5;
	}
	public void setExit5(String exit5) {
		this.exit5 = exit5;
	}
	public Double getModified_duration() {
		return modified_duration;
	}
	public void setModified_duration(Double modified_duration) {
		this.modified_duration = modified_duration;
	}
	public String getScheme_amfi_short_name() {
		return scheme_amfi_short_name;
	}
	public void setScheme_amfi_short_name(String scheme_amfi_short_name) {
		this.scheme_amfi_short_name = scheme_amfi_short_name;
	}
	public Boolean getErstwhile_scheme_merged() {
		return erstwhile_scheme_merged;
	}
	public void setErstwhile_scheme_merged(Boolean erstwhile_scheme_merged) {
		this.erstwhile_scheme_merged = erstwhile_scheme_merged;
	}
	public String getErstwhile_name() {
		return erstwhile_name;
	}
	public void setErstwhile_name(String erstwhile_name) {
		this.erstwhile_name = erstwhile_name;
	}
	public Double getMarket_cap_largecap_percent() {
		return market_cap_largecap_percent;
	}
	public void setMarket_cap_largecap_percent(Double market_cap_largecap_percent) {
		this.market_cap_largecap_percent = market_cap_largecap_percent;
	}
	public Double getMarket_cap_midcap_percent() {
		return market_cap_midcap_percent;
	}
	public void setMarket_cap_midcap_percent(Double market_cap_midcap_percent) {
		this.market_cap_midcap_percent = market_cap_midcap_percent;
	}
	public Double getMarket_cap_smallcap_percent() {
		return market_cap_smallcap_percent;
	}
	public void setMarket_cap_smallcap_percent(Double market_cap_smallcap_percent) {
		this.market_cap_smallcap_percent = market_cap_smallcap_percent;
	}
	public Double getVe_ytm() {
		return ve_ytm;
	}
	public void setVe_ytm(Double ve_ytm) {
		this.ve_ytm = ve_ytm;
	}
	public Integer getEtf_scheme() {
		return etf_scheme;
	}
	public void setEtf_scheme(Integer etf_scheme) {
		this.etf_scheme = etf_scheme;
	}
	public Double getStandard_deviation() {
		return standard_deviation;
	}
	public void setStandard_deviation(Double standard_deviation) {
		this.standard_deviation = standard_deviation;
	}
	public Double getSortino_ratio() {
		return sortino_ratio;
	}
	public void setSortino_ratio(Double sortino_ratio) {
		this.sortino_ratio = sortino_ratio;
	}
	public String getScheme_benchmark_advisorkhoj() {
		return scheme_benchmark_advisorkhoj;
	}
	public void setScheme_benchmark_advisorkhoj(String scheme_benchmark_advisorkhoj) {
		this.scheme_benchmark_advisorkhoj = scheme_benchmark_advisorkhoj;
	}
	public String getScheme_benchmark_advisorkhoj_code() {
		return scheme_benchmark_advisorkhoj_code;
	}
	public void setScheme_benchmark_advisorkhoj_code(String scheme_benchmark_advisorkhoj_code) {
		this.scheme_benchmark_advisorkhoj_code = scheme_benchmark_advisorkhoj_code;
	}
	public String getScheme_company_short_name() {
		return scheme_company_short_name;
	}
	public void setScheme_company_short_name(String scheme_company_short_name) {
		this.scheme_company_short_name = scheme_company_short_name;
	}
	public String getCategory_short_name() {
		return category_short_name;
	}
	public void setCategory_short_name(String category_short_name) {
		this.category_short_name = category_short_name;
	}
	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}	
}

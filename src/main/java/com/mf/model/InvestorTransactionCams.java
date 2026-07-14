package com.mf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "investor_transaction_cams")
public class InvestorTransactionCams 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	Integer id;
	String amc_code;
	String folio_no;
	String prodcode;
	String scheme;
	String inv_name;
	String trxntype;
	int trxnno;
	String trxnmode;
	String trxnstat;
	String usercode;
	String usrtrxno;
	Date traddate;
	Date postdate;
	double purprice;
	double units;
	double amount;
	String brokcode;
	String subbrok;
	double brokperc;
	double brokcomm;
	int altfolio;
	Date rep_date;
	String time1;
	String trxnsubtyp;
	String applicatio;
	String trxn_natur;
	double tax;
	double total_tax;
	String te_15h;
	String micr_no;
	String remarks;
	String swflag;
	String old_folio;
	String seq_no;
	String reinvest_f;
	String mult_brok;
	double stt;
	String location;
	String scheme_typ;
	String tax_status;
	double loads;
	String scanrefno;
	String pan;
	int inv_iin;
	String targ_src_s;
	String trxn_type_;
	String ticob_trty;
	String ticob_trno;
	String ticob_post;
	String dp_id; // if value there DMAT Account
	double trxn_charg;
	double eligib_amt;
	String src_of_txn;
	String trxn_suffi;
	double siptrxnno;
	String ter_locati;
	String euin;
	String euin_valid;
	String euin_opted;
	String sub_brk_ar;
	String exch_dc_fl;
	String src_brk_co;
	String sys_regn_d;
	String ac_no;
	String bank_name;
	String reversal_c;
	String exchange_f;
	String ca_initiat;
	String gst_state;
	String igst_amoun;
	String cgst_amoun;
	String sgst_amoun;
	String rev_remark;
	String client_name;
	Integer user_id;
	String user_name;
	String branch;
	String rm_name;
	String subbroker_name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getFolio_no() {
		return folio_no;
	}
	public void setFolio_no(String folio_no) {
		this.folio_no = folio_no;
	}
	public String getProdcode() {
		return prodcode;
	}
	public void setProdcode(String prodcode) {
		this.prodcode = prodcode;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public String getInv_name() {
		return inv_name;
	}
	public void setInv_name(String inv_name) {
		this.inv_name = inv_name;
	}
	public String getTrxntype() {
		return trxntype;
	}
	public void setTrxntype(String trxntype) {
		this.trxntype = trxntype;
	}
	public int getTrxnno() {
		return trxnno;
	}
	public void setTrxnno(int trxnno) {
		this.trxnno = trxnno;
	}
	public String getTrxnmode() {
		return trxnmode;
	}
	public void setTrxnmode(String trxnmode) {
		this.trxnmode = trxnmode;
	}
	public String getTrxnstat() {
		return trxnstat;
	}
	public void setTrxnstat(String trxnstat) {
		this.trxnstat = trxnstat;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getUsrtrxno() {
		return usrtrxno;
	}
	public void setUsrtrxno(String usrtrxno) {
		this.usrtrxno = usrtrxno;
	}
	public Date getTraddate() {
		return traddate;
	}
	public void setTraddate(Date traddate) {
		this.traddate = traddate;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public double getPurprice() {
		return purprice;
	}
	public void setPurprice(double purprice) {
		this.purprice = purprice;
	}
	public double getUnits() {
		return units;
	}
	public void setUnits(double units) {
		this.units = units;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getBrokcode() {
		return brokcode;
	}
	public void setBrokcode(String brokcode) {
		this.brokcode = brokcode;
	}
	public String getSubbrok() {
		return subbrok;
	}
	public void setSubbrok(String subbrok) {
		this.subbrok = subbrok;
	}
	public double getBrokperc() {
		return brokperc;
	}
	public void setBrokperc(double brokperc) {
		this.brokperc = brokperc;
	}
	public double getBrokcomm() {
		return brokcomm;
	}
	public void setBrokcomm(double brokcomm) {
		this.brokcomm = brokcomm;
	}
	public int getAltfolio() {
		return altfolio;
	}
	public void setAltfolio(int altfolio) {
		this.altfolio = altfolio;
	}
	public Date getRep_date() {
		return rep_date;
	}
	public void setRep_date(Date rep_date) {
		this.rep_date = rep_date;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTrxnsubtyp() {
		return trxnsubtyp;
	}
	public void setTrxnsubtyp(String trxnsubtyp) {
		this.trxnsubtyp = trxnsubtyp;
	}
	public String getApplicatio() {
		return applicatio;
	}
	public void setApplicatio(String applicatio) {
		this.applicatio = applicatio;
	}
	public String getTrxn_natur() {
		return trxn_natur;
	}
	public void setTrxn_natur(String trxn_natur) {
		this.trxn_natur = trxn_natur;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	public double getTotal_tax() {
		return total_tax;
	}
	public void setTotal_tax(double total_tax) {
		this.total_tax = total_tax;
	}
	public String getTe_15h() {
		return te_15h;
	}
	public void setTe_15h(String te_15h) {
		this.te_15h = te_15h;
	}
	public String getMicr_no() {
		return micr_no;
	}
	public void setMicr_no(String micr_no) {
		this.micr_no = micr_no;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSwflag() {
		return swflag;
	}
	public void setSwflag(String swflag) {
		this.swflag = swflag;
	}
	public String getOld_folio() {
		return old_folio;
	}
	public void setOld_folio(String old_folio) {
		this.old_folio = old_folio;
	}
	public String getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(String seq_no) {
		this.seq_no = seq_no;
	}
	public String getReinvest_f() {
		return reinvest_f;
	}
	public void setReinvest_f(String reinvest_f) {
		this.reinvest_f = reinvest_f;
	}
	public String getMult_brok() {
		return mult_brok;
	}
	public void setMult_brok(String mult_brok) {
		this.mult_brok = mult_brok;
	}
	public double getStt() {
		return stt;
	}
	public void setStt(double stt) {
		this.stt = stt;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getScheme_typ() {
		return scheme_typ;
	}
	public void setScheme_typ(String scheme_typ) {
		this.scheme_typ = scheme_typ;
	}
	public String getTax_status() {
		return tax_status;
	}
	public void setTax_status(String tax_status) {
		this.tax_status = tax_status;
	}
	public double getLoads() {
		return loads;
	}
	public void setLoads(double loads) {
		this.loads = loads;
	}
	public String getScanrefno() {
		return scanrefno;
	}
	public void setScanrefno(String scanrefno) {
		this.scanrefno = scanrefno;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public int getInv_iin() {
		return inv_iin;
	}
	public void setInv_iin(int inv_iin) {
		this.inv_iin = inv_iin;
	}
	public String getTarg_src_s() {
		return targ_src_s;
	}
	public void setTarg_src_s(String targ_src_s) {
		this.targ_src_s = targ_src_s;
	}
	public String getTrxn_type_() {
		return trxn_type_;
	}
	public void setTrxn_type_(String trxn_type_) {
		this.trxn_type_ = trxn_type_;
	}
	public String getTicob_trty() {
		return ticob_trty;
	}
	public void setTicob_trty(String ticob_trty) {
		this.ticob_trty = ticob_trty;
	}
	public String getTicob_trno() {
		return ticob_trno;
	}
	public void setTicob_trno(String ticob_trno) {
		this.ticob_trno = ticob_trno;
	}
	public String getTicob_post() {
		return ticob_post;
	}
	public void setTicob_post(String ticob_post) {
		this.ticob_post = ticob_post;
	}
	public String getDp_id() {
		return dp_id;
	}
	public void setDp_id(String dp_id) {
		this.dp_id = dp_id;
	}
	public double getTrxn_charg() {
		return trxn_charg;
	}
	public void setTrxn_charg(double trxn_charg) {
		this.trxn_charg = trxn_charg;
	}
	public double getEligib_amt() {
		return eligib_amt;
	}
	public void setEligib_amt(double eligib_amt) {
		this.eligib_amt = eligib_amt;
	}
	public String getSrc_of_txn() {
		return src_of_txn;
	}
	public void setSrc_of_txn(String src_of_txn) {
		this.src_of_txn = src_of_txn;
	}
	public String getTrxn_suffi() {
		return trxn_suffi;
	}
	public void setTrxn_suffi(String trxn_suffi) {
		this.trxn_suffi = trxn_suffi;
	}
	public double getSiptrxnno() {
		return siptrxnno;
	}
	public void setSiptrxnno(double siptrxnno) {
		this.siptrxnno = siptrxnno;
	}
	public String getTer_locati() {
		return ter_locati;
	}
	public void setTer_locati(String ter_locati) {
		this.ter_locati = ter_locati;
	}
	public String getEuin() {
		return euin;
	}
	public void setEuin(String euin) {
		this.euin = euin;
	}
	public String getEuin_valid() {
		return euin_valid;
	}
	public void setEuin_valid(String euin_valid) {
		this.euin_valid = euin_valid;
	}
	public String getEuin_opted() {
		return euin_opted;
	}
	public void setEuin_opted(String euin_opted) {
		this.euin_opted = euin_opted;
	}
	public String getSub_brk_ar() {
		return sub_brk_ar;
	}
	public void setSub_brk_ar(String sub_brk_ar) {
		this.sub_brk_ar = sub_brk_ar;
	}
	public String getExch_dc_fl() {
		return exch_dc_fl;
	}
	public void setExch_dc_fl(String exch_dc_fl) {
		this.exch_dc_fl = exch_dc_fl;
	}
	public String getSrc_brk_co() {
		return src_brk_co;
	}
	public void setSrc_brk_co(String src_brk_co) {
		this.src_brk_co = src_brk_co;
	}
	public String getSys_regn_d() {
		return sys_regn_d;
	}
	public void setSys_regn_d(String sys_regn_d) {
		this.sys_regn_d = sys_regn_d;
	}
	public String getAc_no() {
		return ac_no;
	}
	public void setAc_no(String ac_no) {
		this.ac_no = ac_no;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getReversal_c() {
		return reversal_c;
	}
	public void setReversal_c(String reversal_c) {
		this.reversal_c = reversal_c;
	}
	public String getExchange_f() {
		return exchange_f;
	}
	public void setExchange_f(String exchange_f) {
		this.exchange_f = exchange_f;
	}
	public String getCa_initiat() {
		return ca_initiat;
	}
	public void setCa_initiat(String ca_initiat) {
		this.ca_initiat = ca_initiat;
	}
	public String getGst_state() {
		return gst_state;
	}
	public void setGst_state(String gst_state) {
		this.gst_state = gst_state;
	}
	public String getIgst_amoun() {
		return igst_amoun;
	}
	public void setIgst_amoun(String igst_amoun) {
		this.igst_amoun = igst_amoun;
	}
	public String getCgst_amoun() {
		return cgst_amoun;
	}
	public void setCgst_amoun(String cgst_amoun) {
		this.cgst_amoun = cgst_amoun;
	}
	public String getSgst_amoun() {
		return sgst_amoun;
	}
	public void setSgst_amoun(String sgst_amoun) {
		this.sgst_amoun = sgst_amoun;
	}
	public String getRev_remark() {
		return rev_remark;
	}
	public void setRev_remark(String rev_remark) {
		this.rev_remark = rev_remark;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
	}
}

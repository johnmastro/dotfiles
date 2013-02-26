" Vim syntax file
" Language:     pgsql
" Maintainer:   Devrim GUNDUZ <devrim@PostgreSQL.org>
" Last Change:  $Date: 2010/03/11 21:43:23 $
" Filenames:    *.pgsql *.plpgsql
" URL:          http://www.gunduz.org/postgresql/pgsql.vim
" Note:         The definitions below are for PostgreSQL 8.4, some versions may differ.
" Changelog:    Thanks to Todd A. Cook for the updates
" Changelog:    Thanks a lot to David Fetter for the big update set, that came as of Mar 11, 2010.

" Preamble {{{

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Always ignore case
syn case ignore

" }}}
" General keywords which don't fall into other categories {{{

syn keyword pgsqlKeyword       abort alter aggregate analyze and as alias add
syn keyword pgsqlKeyword       begin by before
syn keyword pgsqlKeyword       conversion cascade current_date current_time current_timestamp class close
syn keyword pgsqlKeyword       cluster checkpoint check comment
syn keyword pgsqlKeyword       cast cascade character check column columns constraint create copy
syn keyword pgsqlKeyword       database domain databases default delete distinct drop declare deallocate desc
syn keyword pgsqlKeyword       deferrable deferred defaults do diagnostics
syn keyword pgsqlKeyword       explain end exists execute exclusion found exception except each exit
syn keyword pgsqlKeyword       function foreign from full fetch force for
syn keyword pgsqlKeyword       group grant global get
syn keyword pgsqlKeyword       having
syn keyword pgsqlKeyword       index into immutable inner initially immediate inherits instead insert in if
syn keyword pgsqlKeyword       join
syn keyword pgsqlKeyword       key
syn keyword pgsqlKeyword       language lock local limit left load loop
syn keyword pgsqlKeyword       max min move match
syn keyword pgsqlKeyword       notify no new null next
syn keyword pgsqlKeyword       or operator outer order old on out open
syn keyword pgsqlKeyword       prepare plpgsql primary password primary privilege procedure partial prepared
syn keyword pgsqlKeyword       partition preserve perform
syn keyword pgsqlKeyword       query
syn keyword pgsqlKeyword       raise role replace reindex release reset revoke rollback references row rows rule restrict
syn keyword pgsqlKeyword       returns return
syn keyword pgsqlKeyword       select set strict schema sequence savepoint simple system stable setof
syn keyword pgsqlKeyword       truncate to tranaction trigger table tables temp temporary tablespace type
syn keyword pgsqlKeyword       update unique unlisten using
syn keyword pgsqlKeyword       verbose view values varying vacuum
syn keyword pgsqlKeyword       where with

" }}}
" Special values {{{

syn keyword pgsqlSpecial       false null true

" }}}
" Strings (single- and double-quote) {{{

syn region pgsqlString         start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region pgsqlString         start=+'+  skip=+\\\\\|\\'+  end=+'+

" }}}
" Numbers and hexidecimal values {{{

syn match pgsqlNumber          "-\=\<[0-9]*\>"
syn match pgsqlNumber          "-\=\<[0-9]*\.[0-9]*\>"
syn match pgsqlNumber          "-\=\<[0-9]*e[+-]\=[0-9]*\>"
syn match pgsqlNumber          "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match pgsqlNumber          "\<0x[abcdefABCDEF0-9]*\>"

" }}}
" User variables {{{
syn match pgsqlVariable        "@\a*[A-Za-z0-9]*[._]*[A-Za-z0-9]*"

" }}}
" Comments (c-style, pgsql-style and modified sql-style) {{{

syn region pgsqlComment        start="/\*"  end="\*/"
syn match pgsqlComment         "#.*"
syn match pgsqlComment         "--.*"
syn sync ccomment pgsqlComment

" }}}
" Column types {{{

syn keyword pgsqlType          anyarray anyelement abstime anyenum
syn keyword pgsqlType          anynonarray any aclitem bytea bit
syn keyword pgsqlType          boolean bigint box cidr cstring char
syn keyword pgsqlType          character cid circle double date decimal float
syn keyword pgsqlType          gtsvector inet interval internal
syn keyword pgsqlType          int2vector integer line lseg
syn keyword pgsqlType          language_handler macaddr money numeric
syn keyword pgsqlType          name opaque oidvector oid polygon point
syn keyword pgsqlType          path period precision regclass real
syn keyword pgsqlType          regtype refcursor regoperator reltime
syn keyword pgsqlType          record regproc regdictionary regoper
syn keyword pgsqlType          regprocedure regconfig smallint smgr
syn keyword pgsqlType          time tsquery tinterval trigger tid
syn keyword pgsqlType          timestamp text tsvector txid_snapshot
syn keyword pgsqlType          unknown uuid void varchar varying with without
syn keyword pgsqlType          xml xid year zone

" }}}
" Logical, string and  numeric operators {{{

syn keyword pgsqlOperator      between not and or is in
syn keyword pgsqlOperator      like regexp rlike binary exists

" }}}
" Control flow functions {{{

syn keyword pgsqlFlow          case when then else end
syn keyword pgsqlFlow          if ifnull nullif isnull coalesce

" }}}
" General Functions {{{

syn keyword pgsqlFunction      abbrev abs abstime abstimeeq abstimege abstimegt
syn keyword pgsqlFunction      abstimein abstimele abstimelt abstimene abstimeout
syn keyword pgsqlFunction      abstimerecv abstimesend aclcontains aclexplode
syn keyword pgsqlFunction      aclinsert aclitemeq aclitemin aclitemout aclremove
syn keyword pgsqlFunction      acos adjacent after age anyarray_in anyarray_out
syn keyword pgsqlFunction      anyarray_recv anyarray_send anyelement_in
syn keyword pgsqlFunction      anyelement_out anyenum_in anyenum_out any_in
syn keyword pgsqlFunction      anynonarray_in anynonarray_out any_out anytextcat
syn keyword pgsqlFunction      area areajoinsel areasel array_agg
syn keyword pgsqlFunction      array_agg_finalfn array_agg_transfn array_append
syn keyword pgsqlFunction      array_cat arraycontained arraycontains array_dims
syn keyword pgsqlFunction      array_eq array_fill array_ge array_gt
syn keyword pgsqlFunction      array_in array_larger array_le
syn keyword pgsqlFunction      array_length array_lower array_lt array_ndims
syn keyword pgsqlFunction      array_ne array_out arrayoverlap array_prepend
syn keyword pgsqlFunction      array_recv array_send array_smaller
syn keyword pgsqlFunction      array_to_string array_unique array_upper ascii
syn keyword pgsqlFunction      ascii_to_mic ascii_to_utf8 asin atan2 atan avg
syn keyword pgsqlFunction      before big5_to_euc_tw big5_to_mic big5_to_utf8
syn keyword pgsqlFunction      bit_and bitand bitcat bitcmp bit biteq bitge bitgt
syn keyword pgsqlFunction      bit_in bitle bit_length bitlt bitne bitnot bit_or
syn keyword pgsqlFunction      bitor bit_out bit_recv bit_send bitshiftleft
syn keyword pgsqlFunction      bitshiftright bittypmodin bittypmodout bitxor
syn keyword pgsqlFunction      bool_and booland_statefunc bool booleq boolge
syn keyword pgsqlFunction      boolgt boolin boolle boollt boolne bool_or
syn keyword pgsqlFunction      boolor_statefunc boolout boolrecv boolsend
syn keyword pgsqlFunction      box_above box_above_eq box_add box_below
syn keyword pgsqlFunction      box_below_eq box_center box_contained box_contain
syn keyword pgsqlFunction      box_contain_pt box_distance box_div box box_eq
syn keyword pgsqlFunction      box_ge box_gt box_in box_intersect box_le box_left
syn keyword pgsqlFunction      box_lt box_mul box_out box_overabove box_overbelow
syn keyword pgsqlFunction      box_overlap box_overleft box_overright box_recv
syn keyword pgsqlFunction      box_right box_same box_send box_sub bpcharcmp
syn keyword pgsqlFunction      bpchar bpchareq bpcharge bpchargt bpchariclike
syn keyword pgsqlFunction      bpcharicnlike bpcharicregexeq bpcharicregexne
syn keyword pgsqlFunction      bpcharin bpchar_larger bpcharle bpcharlike
syn keyword pgsqlFunction      bpcharlt bpcharne bpcharnlike bpcharout
syn keyword pgsqlFunction      bpchar_pattern_ge bpchar_pattern_gt
syn keyword pgsqlFunction      bpchar_pattern_le bpchar_pattern_lt bpcharrecv
syn keyword pgsqlFunction      bpcharregexeq bpcharregexne bpcharsend
syn keyword pgsqlFunction      bpchar_smaller bpchartypmodin bpchartypmodout
syn keyword pgsqlFunction      broadcast btabstimecmp btarraycmp btbeginscan
syn keyword pgsqlFunction      btboolcmp btbpchar_pattern_cmp btbuild
syn keyword pgsqlFunction      btbulkdelete btcharcmp btcostestimate btendscan
syn keyword pgsqlFunction      btfloat48cmp btfloat4cmp btfloat84cmp btfloat8cmp
syn keyword pgsqlFunction      btgetbitmap btgettuple btinsert btint24cmp
syn keyword pgsqlFunction      btint28cmp btint2cmp btint42cmp btint48cmp
syn keyword pgsqlFunction      btint4cmp btint82cmp btint84cmp btint8cmp
syn keyword pgsqlFunction      btmarkpos btnamecmp btoidcmp btoidvectorcmp
syn keyword pgsqlFunction      btoptions btrecordcmp btreltimecmp btrescan
syn keyword pgsqlFunction      btrestrpos btrim bttextcmp bttext_pattern_cmp
syn keyword pgsqlFunction      bttidcmp bttintervalcmp btvacuumcleanup byteacat
syn keyword pgsqlFunction      byteacmp byteaeq byteage byteagt byteain byteale
syn keyword pgsqlFunction      bytealike bytealt byteane byteanlike byteaout
syn keyword pgsqlFunction      bytearecv byteasend cash_cmp cash_div_flt4
syn keyword pgsqlFunction      cash_div_flt8 cash_div_int2 cash_div_int4 cash_eq
syn keyword pgsqlFunction      cash_ge cash_gt cash_in cashlarger cash_le cash_lt
syn keyword pgsqlFunction      cash_mi cash_mul_flt4 cash_mul_flt8 cash_mul_int2
syn keyword pgsqlFunction      cash_mul_int4 cash_ne cash_out cash_pl cash_recv
syn keyword pgsqlFunction      cash_send cashsmaller cash_words cbrt ceil ceiling
syn keyword pgsqlFunction      center character_length chareq charge chargt
syn keyword pgsqlFunction      charin charle char_length charlt charne charout
syn keyword pgsqlFunction      charrecv charsend chr cideq cidin cidout cidrecv
syn keyword pgsqlFunction      cidr cidr_in cidr_out cidr_recv cidr_send cidsend
syn keyword pgsqlFunction      circle_above circle_add_pt circle_below
syn keyword pgsqlFunction      circle_center circle_contained circle_contain
syn keyword pgsqlFunction      circle_contain_pt circle_distance circle_div_pt
syn keyword pgsqlFunction      circle circle_eq circle_ge circle_gt circle_in
syn keyword pgsqlFunction      circle_le circle_left circle_lt circle_mul_pt
syn keyword pgsqlFunction      circle_ne circle_out circle_overabove
syn keyword pgsqlFunction      circle_overbelow circle_overlap circle_overleft
syn keyword pgsqlFunction      circle_overright circle_recv circle_right
syn keyword pgsqlFunction      circle_same circle_send circle_sub_pt
syn keyword pgsqlFunction      clock_timestamp close_lb close_lseg close_ls
syn keyword pgsqlFunction      close_pb close_pl close_ps close_sb close_sl
"syn keyword pgsqlFunction     contains
syn keyword pgsqlFunction      col_description contained_by contjoinsel
syn keyword pgsqlFunction      contsel convert convert_from convert_to corr cos
syn keyword pgsqlFunction      cot count covar_pop covar_samp cstring_in
syn keyword pgsqlFunction      cstring_out cstring_recv cstring_send cume_dist
syn keyword pgsqlFunction      current_database current_query current_schema
syn keyword pgsqlFunction      current_schemas current_setting current_user
syn keyword pgsqlFunction      currtid2 currtid currval cursor_to_xml
syn keyword pgsqlFunction      cursor_to_xmlschema database_to_xml_and_xmlschema
syn keyword pgsqlFunction      database_to_xml database_to_xmlschema date_cmp
syn keyword pgsqlFunction      date_cmp_timestamp date_cmp_timestamptz date
syn keyword pgsqlFunction      date_eq date_eq_timestamp date_eq_timestamptz
syn keyword pgsqlFunction      date_ge date_ge_timestamp date_ge_timestamptz
syn keyword pgsqlFunction      date_gt date_gt_timestamp date_gt_timestamptz
syn keyword pgsqlFunction      date_in date_larger date_le date_le_timestamp
syn keyword pgsqlFunction      date_le_timestamptz date_lt date_lt_timestamp
syn keyword pgsqlFunction      date_lt_timestamptz date_mi date_mii
syn keyword pgsqlFunction      date_mi_interval date_ne date_ne_timestamp
syn keyword pgsqlFunction      date_ne_timestamptz date_out date_part date_pli
syn keyword pgsqlFunction      date_pl_interval date_recv date_send date_smaller
syn keyword pgsqlFunction      datetime_pl datetimetz_pl date_trunc dcbrt decode
syn keyword pgsqlFunction      degrees dense_rank dexp diagonal diameter
syn keyword pgsqlFunction      dispell_init dispell_lexize dist_cpoly dist_lb
syn keyword pgsqlFunction      dist_pb dist_pc dist_pl dist_ppath dist_ps dist_sb
syn keyword pgsqlFunction      dist_sl div dlog10 dlog1 domain_in domain_recv
syn keyword pgsqlFunction      dpow dround dsimple_init dsimple_lexize
syn keyword pgsqlFunction      dsnowball_init dsnowball_lexize dsqrt
syn keyword pgsqlFunction      dsynonym_init dsynonym_lexize dtrunc empty_period
syn keyword pgsqlFunction      encode enum_cmp enum_eq enum_first enum_ge enum_gt
syn keyword pgsqlFunction      enum_in enum_larger enum_last enum_le enum_lt
syn keyword pgsqlFunction      enum_ne enum_out enum_range enum_recv enum_send
syn keyword pgsqlFunction      enum_smaller eqjoinsel eqsel equals euc_cn_to_mic
syn keyword pgsqlFunction      euc_cn_to_utf8 euc_jis_2004_to_shift_jis_2004
syn keyword pgsqlFunction      euc_jis_2004_to_utf8 euc_jp_to_mic euc_jp_to_sjis
syn keyword pgsqlFunction      euc_jp_to_utf8 euc_kr_to_mic euc_kr_to_utf8
syn keyword pgsqlFunction      euc_tw_to_big5 euc_tw_to_mic euc_tw_to_utf8 every
syn keyword pgsqlFunction      exp extract factorial family first first_value
syn keyword pgsqlFunction      float48div float48ge float48gt float48le float48lt
syn keyword pgsqlFunction      float48eq float48mi float48mul float48ne float48pl
syn keyword pgsqlFunction      float4abs float4_accum float4div float4 float4eq
syn keyword pgsqlFunction      float4ge float4in float4larger float4le float4lt
syn keyword pgsqlFunction      float4gt float8_regr_accum float8_regr_avgx
syn keyword pgsqlFunction      float4mi float4mul float4ne float4out float4pl
syn keyword pgsqlFunction      float4recv float4send float4smaller float4um
syn keyword pgsqlFunction      float4up float84div float84eq float84ge float84gt
syn keyword pgsqlFunction      float84le float84lt float84mi float84mul float84ne
syn keyword pgsqlFunction      float84pl float8abs float8_accum float8_avg
syn keyword pgsqlFunction      float8_corr float8_covar_pop float8_covar_samp
syn keyword pgsqlFunction      float8div float8 float8eq float8ge float8gt
syn keyword pgsqlFunction      float8in float8larger float8le float8lt float8mi
syn keyword pgsqlFunction      float8mul float8ne float8out float8pl float8recv
syn keyword pgsqlFunction      float8_regr_avgy float8_regr_intercept
syn keyword pgsqlFunction      float8_regr_r2 float8_regr_slope float8_regr_sxx
syn keyword pgsqlFunction      float8_regr_sxy float8_regr_syy float8send
syn keyword pgsqlFunction      float8smaller float8_stddev_pop float8_stddev_samp
syn keyword pgsqlFunction      float8um float8up float8_var_pop float8_var_samp
syn keyword pgsqlFunction      floor flt4_mul_cash flt8_mul_cash fmgr_c_validator
syn keyword pgsqlFunction      fmgr_internal_validator fmgr_sql_validator
syn keyword pgsqlFunction      format_type gb18030_to_utf8 gbk_to_utf8
syn keyword pgsqlFunction      generate_series generate_subscripts get_bit
syn keyword pgsqlFunction      get_byte get_current_ts_config getdatabaseencoding
syn keyword pgsqlFunction      getpgusername ginarrayconsistent ginarrayextract
syn keyword pgsqlFunction      ginbeginscan ginbuild ginbulkdelete gin_cmp_prefix
syn keyword pgsqlFunction      gin_cmp_tslexeme gincostestimate ginendscan
syn keyword pgsqlFunction      gin_extract_tsquery gin_extract_tsvector
syn keyword pgsqlFunction      gingetbitmap gininsert ginmarkpos ginoptions
syn keyword pgsqlFunction      ginqueryarrayextract ginrescan ginrestrpos
syn keyword pgsqlFunction      gin_tsquery_consistent ginvacuumcleanup
syn keyword pgsqlFunction      gistbeginscan gist_box_compress
syn keyword pgsqlFunction      gist_box_consistent gist_box_decompress
syn keyword pgsqlFunction      gist_box_penalty gist_box_picksplit gist_box_same
syn keyword pgsqlFunction      gist_box_union gistbuild gistbulkdelete
syn keyword pgsqlFunction      gist_circle_compress gist_circle_consistent
syn keyword pgsqlFunction      gistcostestimate gistendscan gistgetbitmap
syn keyword pgsqlFunction      gistgettuple gistinsert gistmarkpos gistoptions
syn keyword pgsqlFunction      gist_period_compress gist_period_consistent
syn keyword pgsqlFunction      gist_period_decompress gist_period_penalty
syn keyword pgsqlFunction      gist_period_picksplit gist_period_same
syn keyword pgsqlFunction      gist_period_union gist_point_compress
syn keyword pgsqlFunction      gist_point_consistent gist_poly_compress
syn keyword pgsqlFunction      gist_poly_consistent gistrescan gistrestrpos
syn keyword pgsqlFunction      gistvacuumcleanup gtsquery_compress
syn keyword pgsqlFunction      gtsquery_consistent gtsquery_decompress
syn keyword pgsqlFunction      gtsquery_penalty gtsquery_picksplit gtsquery_same
syn keyword pgsqlFunction      gtsquery_union gtsvector_compress
syn keyword pgsqlFunction      gtsvector_consistent gtsvector_decompress
syn keyword pgsqlFunction      gtsvectorin gtsvectorout gtsvector_penalty
syn keyword pgsqlFunction      gtsvector_picksplit gtsvector_same gtsvector_union
syn keyword pgsqlFunction      has_any_column_privilege has_column_privilege
syn keyword pgsqlFunction      has_database_privilege
syn keyword pgsqlFunction      has_foreign_data_wrapper_privilege
syn keyword pgsqlFunction      has_function_privilege hash_aclitem hashbeginscan
syn keyword pgsqlFunction      hashbpchar hashbuild hashbulkdelete hashchar
syn keyword pgsqlFunction      hashcostestimate hashendscan hashenum hashfloat4
syn keyword pgsqlFunction      hashfloat8 hashgetbitmap hashgettuple hashinet
syn keyword pgsqlFunction      hashinsert hashint2 hashint2vector hashint4
syn keyword pgsqlFunction      hashint8 hashmacaddr hashmarkpos hashname
syn keyword pgsqlFunction      hash_numeric hashoid hashoidvector hashoptions
syn keyword pgsqlFunction      hashrescan hashrestrpos hashtext hashvacuumcleanup
syn keyword pgsqlFunction      hashvarlena has_language_privilege
syn keyword pgsqlFunction      has_schema_privilege has_sequence_privilege
syn keyword pgsqlFunction      has_server_privilege has_table_privilege
syn keyword pgsqlFunction      has_tablespace_privilege height host hostmask
syn keyword pgsqlFunction      iclikejoinsel iclikesel icnlikejoinsel icnlikesel
syn keyword pgsqlFunction      icregexeqjoinsel icregexeqsel icregexnejoinsel
syn keyword pgsqlFunction      icregexnesel inetand inet_client_addr
syn keyword pgsqlFunction      inet_client_port inet_in inetmi inetmi_int8
syn keyword pgsqlFunction      inetnot inetor inet_out inetpl inet_recv inet_send
syn keyword pgsqlFunction      inet_server_addr inet_server_port initcap int24div
syn keyword pgsqlFunction      int24eq int24ge int24gt int24le int24lt int24mi
syn keyword pgsqlFunction      int24mul int24ne int24pl int28div int28eq int28ge
syn keyword pgsqlFunction      int28gt int28le int28lt int28mi int28mul int28ne
syn keyword pgsqlFunction      int28pl int2abs int2_accum int2and int2_avg_accum
syn keyword pgsqlFunction      int2div int2 int2eq int2ge int2gt int2in
syn keyword pgsqlFunction      int2larger int2le int2lt int2mi int2mod
syn keyword pgsqlFunction      int2_mul_cash int2mul int2ne int2not int2or
syn keyword pgsqlFunction      int2out int2pl int2recv int2send int2shl int2shr
syn keyword pgsqlFunction      int2smaller int2_sum int2um int2up int2vectoreq
syn keyword pgsqlFunction      int2vectorin int2vectorout int2vectorrecv
syn keyword pgsqlFunction      int2vectorsend int2xor int42div int42eq int42ge
syn keyword pgsqlFunction      int42gt int42le int42lt int42mi int42mul int42ne
syn keyword pgsqlFunction      int42pl int48div int48eq int48ge int48gt int48le
syn keyword pgsqlFunction      int48lt int48mi int48mul int48ne int48pl int4abs
syn keyword pgsqlFunction      int4_accum int4and int4_avg_accum int4div int4
syn keyword pgsqlFunction      int4eq int4ge int4gt int4inc int4in int4larger
syn keyword pgsqlFunction      int4le int4lt int4mi int4mod int4_mul_cash int4mul
syn keyword pgsqlFunction      int4ne int4not int4or int4out int4pl int4recv
syn keyword pgsqlFunction      int4send int4shl int4shr int4smaller int4_sum
syn keyword pgsqlFunction      int4um int4up int4xor int82div int82eq int82ge
syn keyword pgsqlFunction      int82gt int82le int82lt int82mi int82mul int82ne
syn keyword pgsqlFunction      int82pl int84div int84eq int84ge int84gt int84le
syn keyword pgsqlFunction      int84lt int84mi int84mul int84ne int84pl int8abs
syn keyword pgsqlFunction      int8_accum int8and int8_avg_accum int8_avg int8div
syn keyword pgsqlFunction      int8 int8eq int8ge int8gt int8inc_any int8inc
syn keyword pgsqlFunction      int8inc_float8_float8 int8in int8larger int8le
syn keyword pgsqlFunction      int8lt int8mi int8mod int8mul int8ne int8not
syn keyword pgsqlFunction      int8or int8out int8pl int8pl_inet int8recv
syn keyword pgsqlFunction      int8send int8shl int8shr int8smaller int8_sum
syn keyword pgsqlFunction      int8um int8up int8xor integer_pl_date inter_lb
syn keyword pgsqlFunction      internal_in internal_out inter_sb inter_sl
syn keyword pgsqlFunction      interval_accum interval_avg interval_cmp
syn keyword pgsqlFunction      interval_div interval interval_eq interval_ge
syn keyword pgsqlFunction      interval_gt interval_hash interval_in
syn keyword pgsqlFunction      interval_larger interval_le interval_lt
syn keyword pgsqlFunction      interval_mi interval_mul interval_ne interval_out
syn keyword pgsqlFunction      interval_pl_date interval_pl interval_pl_time
syn keyword pgsqlFunction      interval_pl_timestamp interval_pl_timestamptz
syn keyword pgsqlFunction      interval_pl_timetz interval_recv interval_send
syn keyword pgsqlFunction      interval_smaller intervaltypmodin
syn keyword pgsqlFunction      intervaltypmodout interval_um intinterval isclosed
syn keyword pgsqlFunction      is_empty isfinite ishorizontal iso8859_1_to_utf8
syn keyword pgsqlFunction      iso8859_to_utf8 isopen iso_to_koi8r iso_to_mic
syn keyword pgsqlFunction      iso_to_win1251 iso_to_win866 isparallel isperp
syn keyword pgsqlFunction      isvertical johab_to_utf8 justify_days
syn keyword pgsqlFunction      justify_hours justify_interval koi8r_to_iso
syn keyword pgsqlFunction      koi8r_to_mic koi8r_to_utf8 koi8r_to_win1251
syn keyword pgsqlFunction      koi8r_to_win866 koi8u_to_utf8 lag
syn keyword pgsqlFunction      language_handler_in language_handler_out last
syn keyword pgsqlFunction      lastval last_value latin1_to_mic latin2_to_mic
syn keyword pgsqlFunction      latin2_to_win1250 latin3_to_mic latin4_to_mic lead
syn keyword pgsqlFunction      length like like_escape likejoinsel likesel
syn keyword pgsqlFunction      line_distance line line_eq line_horizontal line_in
syn keyword pgsqlFunction      line_interpt line_intersect line_out line_parallel
syn keyword pgsqlFunction      line_perp line_recv line_send line_vertical ln
syn keyword pgsqlFunction      lo_close lo_create lo_creat lo_export log
syn keyword pgsqlFunction      lo_import lo_lseek lo_open loread lo_tell
syn keyword pgsqlFunction      lo_truncate lo_unlink lower lowrite lpad
syn keyword pgsqlFunction      lseg_center lseg_distance lseg lseg_eq lseg_ge
syn keyword pgsqlFunction      lseg_gt lseg_horizontal lseg_in lseg_interpt
syn keyword pgsqlFunction      lseg_intersect lseg_le lseg_length lseg_lt lseg_ne
syn keyword pgsqlFunction      lseg_out lseg_parallel lseg_perp lseg_recv
syn keyword pgsqlFunction      lseg_send lseg_vertical ltrim macaddr_cmp
syn keyword pgsqlFunction      macaddr_eq macaddr_ge macaddr_gt macaddr_in
syn keyword pgsqlFunction      macaddr_le macaddr_lt macaddr_ne macaddr_out
syn keyword pgsqlFunction      macaddr_recv macaddr_send makeaclitem masklen max
syn keyword pgsqlFunction      md5 mic_to_ascii mic_to_big5 mic_to_euc_cn
syn keyword pgsqlFunction      mic_to_euc_jp mic_to_euc_kr mic_to_euc_tw
syn keyword pgsqlFunction      mic_to_iso mic_to_koi8r mic_to_latin1
syn keyword pgsqlFunction      mic_to_latin2 mic_to_latin3 mic_to_latin4
syn keyword pgsqlFunction      mic_to_sjis mic_to_win1250 mic_to_win1251
syn keyword pgsqlFunction      mic_to_win866 min minus mktinterval mod
syn keyword pgsqlFunction      mul_d_interval name nameeq namege namegt
syn keyword pgsqlFunction      nameiclike nameicnlike nameicregexeq nameicregexne
syn keyword pgsqlFunction      namein namele namelike namelt namene namenlike
syn keyword pgsqlFunction      nameout namerecv nameregexeq nameregexne namesend
syn keyword pgsqlFunction      neqjoinsel neqsel nequals netmask network_cmp
syn keyword pgsqlFunction      network network_eq network_ge network_gt
syn keyword pgsqlFunction      network_le network_lt network_ne network_sub
syn keyword pgsqlFunction      network_subeq network_sup network_supeq next
syn keyword pgsqlFunction      nextval ninetyfive nlikejoinsel nlikesel notlike
syn keyword pgsqlFunction      now npoints nth_value ntile numeric_abs
syn keyword pgsqlFunction      numeric_accum numeric_add numeric_avg_accum
syn keyword pgsqlFunction      numeric_avg numeric_cmp numeric_div
syn keyword pgsqlFunction      numeric_div_trunc numeric numeric_eq numeric_exp
syn keyword pgsqlFunction      numeric_fac numeric_ge numeric_gt numeric_inc
syn keyword pgsqlFunction      numeric_in numeric_larger numeric_le numeric_ln
syn keyword pgsqlFunction      numeric_log numeric_lt numeric_mod numeric_mul
syn keyword pgsqlFunction      numeric_ne numeric_out numeric_power numeric_recv
syn keyword pgsqlFunction      numeric_send numeric_smaller numeric_sqrt
syn keyword pgsqlFunction      numeric_stddev_pop numeric_stddev_samp numeric_sub
syn keyword pgsqlFunction      numerictypmodin numerictypmodout numeric_uminus
syn keyword pgsqlFunction      numeric_uplus numeric_var_pop numeric_var_samp
syn keyword pgsqlFunction      numnode obj_description octet_length oid oideq
syn keyword pgsqlFunction      oidge oidgt oidin oidlarger oidle oidlt oidne
syn keyword pgsqlFunction      oidout oidrecv oidsend oidsmaller oidvectoreq
syn keyword pgsqlFunction      oidvectorge oidvectorgt oidvectorin oidvectorle
syn keyword pgsqlFunction      oidvectorlt oidvectorne oidvectorout oidvectorrecv
syn keyword pgsqlFunction      oidvectorsend oidvectortypes on_pb on_pl on_ppath
syn keyword pgsqlFunction      on_ps on_sb on_sl opaque_in opaque_out overlaps
syn keyword pgsqlFunction      overlay overleft overright path_add path_add_pt
syn keyword pgsqlFunction      path_center path_contain_pt path_distance
syn keyword pgsqlFunction      path_div_pt path path_in path_inter path_length
syn keyword pgsqlFunction      path_mul_pt path_n_eq path_n_ge path_n_gt
syn keyword pgsqlFunction      path_n_le path_n_lt path_npoints path_out
syn keyword pgsqlFunction      path_recv path_send path_sub_pt pclose
syn keyword pgsqlFunction      percent_rank period_cc period_co period period_in
syn keyword pgsqlFunction      period_intersect period_oc period_offset
syn keyword pgsqlFunction      period_offset_sec period_oo period_out
syn keyword pgsqlFunction      period_union pg_advisory_lock
syn keyword pgsqlFunction      pg_advisory_lock_shared pg_advisory_unlock_all
syn keyword pgsqlFunction      pg_advisory_unlock pg_advisory_unlock_shared
syn keyword pgsqlFunction      pg_backend_pid pg_cancel_backend
syn keyword pgsqlFunction      pg_char_to_encoding pg_client_encoding
syn keyword pgsqlFunction      pg_column_size pg_conf_load_time
syn keyword pgsqlFunction      pg_conversion_is_visible
syn keyword pgsqlFunction      pg_current_xlog_insert_location
syn keyword pgsqlFunction      pg_current_xlog_location pg_cursor
syn keyword pgsqlFunction      pg_database_size pg_encoding_max_length
syn keyword pgsqlFunction      pg_encoding_to_char pg_function_is_visible
syn keyword pgsqlFunction      pg_get_constraintdef pg_get_expr
syn keyword pgsqlFunction      pg_get_function_arguments pg_get_functiondef
syn keyword pgsqlFunction      pg_get_function_identity_arguments
syn keyword pgsqlFunction      pg_get_function_result pg_get_indexdef
syn keyword pgsqlFunction      pg_get_keywords pg_get_ruledef
syn keyword pgsqlFunction      pg_get_serial_sequence pg_get_triggerdef
syn keyword pgsqlFunction      pg_get_userbyid pg_get_viewdef pg_has_role
syn keyword pgsqlFunction      pg_indexes_size pg_is_in_recovery
syn keyword pgsqlFunction      pg_is_other_temp_schema
syn keyword pgsqlFunction      pg_last_xlog_receive_location
syn keyword pgsqlFunction      pg_last_xlog_replay_location pg_listening_channels
syn keyword pgsqlFunction      pg_lock_status pg_ls_dir pg_my_temp_schema
syn keyword pgsqlFunction      pg_notify pg_opclass_is_visible
syn keyword pgsqlFunction      pg_operator_is_visible pg_options_to_table
syn keyword pgsqlFunction      pg_postmaster_start_time pg_prepared_statement
syn keyword pgsqlFunction      pg_prepared_xact pg_read_file pg_relation_filenode
syn keyword pgsqlFunction      pg_relation_filepath pg_relation_size
syn keyword pgsqlFunction      pg_reload_conf pg_rotate_logfile
syn keyword pgsqlFunction      pg_show_all_settings pg_size_pretty pg_sleep
syn keyword pgsqlFunction      pg_start_backup pg_stat_clear_snapshot
syn keyword pgsqlFunction      pg_stat_file pg_stat_get_activity
syn keyword pgsqlFunction      pg_stat_get_backend_activity
syn keyword pgsqlFunction      pg_stat_get_backend_activity_start
syn keyword pgsqlFunction      pg_stat_get_backend_client_addr
syn keyword pgsqlFunction      pg_stat_get_backend_client_port
syn keyword pgsqlFunction      pg_stat_get_backend_dbid pg_stat_get_backend_idset
syn keyword pgsqlFunction      pg_stat_get_backend_pid pg_stat_get_backend_start
syn keyword pgsqlFunction      pg_stat_get_backend_userid
syn keyword pgsqlFunction      pg_stat_get_backend_waiting
syn keyword pgsqlFunction      pg_stat_get_backend_xact_start
syn keyword pgsqlFunction      pg_stat_get_bgwriter_buf_written_checkpoints
syn keyword pgsqlFunction      pg_stat_get_bgwriter_buf_written_clean
syn keyword pgsqlFunction      pg_stat_get_bgwriter_maxwritten_clean
syn keyword pgsqlFunction      pg_stat_get_bgwriter_requested_checkpoints
syn keyword pgsqlFunction      pg_stat_get_bgwriter_timed_checkpoints
syn keyword pgsqlFunction      pg_stat_get_blocks_fetched pg_stat_get_blocks_hit
syn keyword pgsqlFunction      pg_stat_get_buf_alloc
syn keyword pgsqlFunction      pg_stat_get_buf_written_backend
syn keyword pgsqlFunction      pg_stat_get_db_blocks_fetched
syn keyword pgsqlFunction      pg_stat_get_db_blocks_hit
syn keyword pgsqlFunction      pg_stat_get_db_numbackends
syn keyword pgsqlFunction      pg_stat_get_db_tuples_deleted
syn keyword pgsqlFunction      pg_stat_get_db_tuples_fetched
syn keyword pgsqlFunction      pg_stat_get_db_tuples_inserted
syn keyword pgsqlFunction      pg_stat_get_db_tuples_returned
syn keyword pgsqlFunction      pg_stat_get_db_tuples_updated
syn keyword pgsqlFunction      pg_stat_get_db_xact_commit
syn keyword pgsqlFunction      pg_stat_get_db_xact_rollback
syn keyword pgsqlFunction      pg_stat_get_dead_tuples pg_stat_get_function_calls
syn keyword pgsqlFunction      pg_stat_get_function_self_time
syn keyword pgsqlFunction      pg_stat_get_function_time
syn keyword pgsqlFunction      pg_stat_get_last_analyze_time
syn keyword pgsqlFunction      pg_stat_get_last_autoanalyze_time
syn keyword pgsqlFunction      pg_stat_get_last_autovacuum_time
syn keyword pgsqlFunction      pg_stat_get_last_vacuum_time
syn keyword pgsqlFunction      pg_stat_get_live_tuples pg_stat_get_numscans
syn keyword pgsqlFunction      pg_stat_get_tuples_deleted
syn keyword pgsqlFunction      pg_stat_get_tuples_fetched
syn keyword pgsqlFunction      pg_stat_get_tuples_hot_updated
syn keyword pgsqlFunction      pg_stat_get_tuples_inserted
syn keyword pgsqlFunction      pg_stat_get_tuples_returned
syn keyword pgsqlFunction      pg_stat_get_tuples_updated pg_stat_reset
syn keyword pgsqlFunction      pg_stat_reset_shared
syn keyword pgsqlFunction      pg_stat_reset_single_function_counters
syn keyword pgsqlFunction      pg_stat_reset_single_table_counters pg_stop_backup
syn keyword pgsqlFunction      pg_switch_xlog pg_table_is_visible pg_table_size
syn keyword pgsqlFunction      pg_tablespace_databases pg_tablespace_size
syn keyword pgsqlFunction      pg_terminate_backend pg_timezone_abbrevs
syn keyword pgsqlFunction      pg_timezone_names pg_total_relation_size
syn keyword pgsqlFunction      pg_try_advisory_lock pg_try_advisory_lock_shared
syn keyword pgsqlFunction      pg_ts_config_is_visible pg_ts_dict_is_visible
syn keyword pgsqlFunction      pg_ts_parser_is_visible pg_ts_template_is_visible
syn keyword pgsqlFunction      pg_type_is_visible pg_typeof pg_xlogfile_name
syn keyword pgsqlFunction      pg_xlogfile_name_offset pi plainto_tsquery
syn keyword pgsqlFunction      plpgsql_call_handler plpgsql_inline_handler
syn keyword pgsqlFunction      plpgsql_validator point_above point_add
syn keyword pgsqlFunction      point_below point_distance point_div point
syn keyword pgsqlFunction      point_eq point_horiz point_in point_left point_mul
syn keyword pgsqlFunction      point_ne point_out point_recv point_right
syn keyword pgsqlFunction      point_send point_sub point_vert poly_above
syn keyword pgsqlFunction      poly_below poly_center poly_contained poly_contain
syn keyword pgsqlFunction      poly_contain_pt poly_distance polygon poly_in
syn keyword pgsqlFunction      poly_left poly_npoints poly_out poly_overabove
syn keyword pgsqlFunction      poly_overbelow poly_overlap poly_overleft
syn keyword pgsqlFunction      poly_overright poly_recv poly_right poly_same
syn keyword pgsqlFunction      poly_send popen position positionjoinsel
syn keyword pgsqlFunction      positionsel postgresql_fdw_validator pow power
syn keyword pgsqlFunction      prior prsd_end prsd_headline prsd_lextype
syn keyword pgsqlFunction      prsd_nexttoken prsd_start pt_contained_circle
syn keyword pgsqlFunction      pt_contained_poly query_to_xml_and_xmlschema
syn keyword pgsqlFunction      query_to_xml query_to_xmlschema querytree
syn keyword pgsqlFunction      quote_ident quote_literal quote_nullable radians
syn keyword pgsqlFunction      radius random rank record_eq record_ge record_gt
syn keyword pgsqlFunction      record_in record_le record_lt record_ne record_out
syn keyword pgsqlFunction      record_recv record_send regclass regclassin
syn keyword pgsqlFunction      regclassout regclassrecv regclasssend regconfigin
syn keyword pgsqlFunction      regconfigout regconfigrecv regconfigsend
syn keyword pgsqlFunction      regdictionaryin regdictionaryout regdictionaryrecv
syn keyword pgsqlFunction      regdictionarysend regexeqjoinsel regexeqsel
syn keyword pgsqlFunction      regexnejoinsel regexnesel regexp_matches
syn keyword pgsqlFunction      regexp_replace regexp_split_to_array
syn keyword pgsqlFunction      regexp_split_to_table regoperatorin regoperatorout
syn keyword pgsqlFunction      regoperatorrecv regoperatorsend regoperin
syn keyword pgsqlFunction      regoperout regoperrecv regopersend regprocedurein
syn keyword pgsqlFunction      regprocedureout regprocedurerecv regproceduresend
syn keyword pgsqlFunction      regprocin regprocout regprocrecv regprocsend
syn keyword pgsqlFunction      regr_avgx regr_avgy regr_count regr_intercept
syn keyword pgsqlFunction      regr_r2 regr_slope regr_sxx regr_sxy regr_syy
syn keyword pgsqlFunction      regtypein regtypeout regtyperecv regtypesend
syn keyword pgsqlFunction      reltime reltimeeq reltimege reltimegt reltimein
syn keyword pgsqlFunction      reltimele reltimelt reltimene reltimeout
syn keyword pgsqlFunction      reltimerecv reltimesend repeat replace
syn keyword pgsqlFunction      RI_FKey_cascade_del RI_FKey_cascade_upd
syn keyword pgsqlFunction      RI_FKey_check_ins RI_FKey_check_upd
syn keyword pgsqlFunction      RI_FKey_noaction_del RI_FKey_noaction_upd
syn keyword pgsqlFunction      RI_FKey_restrict_del RI_FKey_restrict_upd
syn keyword pgsqlFunction      RI_FKey_setdefault_del RI_FKey_setdefault_upd
syn keyword pgsqlFunction      RI_FKey_setnull_del RI_FKey_setnull_upd round
syn keyword pgsqlFunction      row_number rpad rtrim scalargtjoinsel scalargtsel
syn keyword pgsqlFunction      scalarltjoinsel scalarltsel
syn keyword pgsqlFunction      schema_to_xml_and_xmlschema schema_to_xml
syn keyword pgsqlFunction      schema_to_xmlschema session_user set_bit set_byte
syn keyword pgsqlFunction      set_config set_masklen setseed setval setweight
syn keyword pgsqlFunction      shell_in shell_out shift_jis_2004_to_euc_jis_2004
syn keyword pgsqlFunction      shift_jis_2004_to_utf8 shobj_description sign
syn keyword pgsqlFunction      similar_escape sin sjis_to_euc_jp sjis_to_mic
syn keyword pgsqlFunction      sjis_to_utf8 slope smgreq smgrin smgrne smgrout
syn keyword pgsqlFunction      split_part sqrt statement_timestamp stddev
syn keyword pgsqlFunction      stddev_pop stddev_samp string_agg_delim_transfn
syn keyword pgsqlFunction      string_agg string_agg_finalfn string_agg_transfn
syn keyword pgsqlFunction      string_to_array strip strpos substr substring
syn keyword pgsqlFunction      sudoku sum suppress_redundant_updates_trigger
syn keyword pgsqlFunction      table_to_xml_and_xmlschema table_to_xml
syn keyword pgsqlFunction      table_to_xmlschema tan textanycat textcat text
syn keyword pgsqlFunction      texteq text_ge text_gt texticlike texticnlike
syn keyword pgsqlFunction      texticregexeq texticregexne textin text_larger
syn keyword pgsqlFunction      text_le textlen textlike text_lt textne textnlike
syn keyword pgsqlFunction      textout text_pattern_ge text_pattern_gt
syn keyword pgsqlFunction      text_pattern_le text_pattern_lt textrecv
syn keyword pgsqlFunction      textregexeq textregexne textsend text_smaller
syn keyword pgsqlFunction      thesaurus_init thesaurus_lexize tideq tidge tidgt
syn keyword pgsqlFunction      tidin tidlarger tidle tidlt tidne tidout tidrecv
syn keyword pgsqlFunction      tidsend tidsmaller time_cmp timedate_pl time
syn keyword pgsqlFunction      time_eq time_ge time_gt time_hash time_in
syn keyword pgsqlFunction      time_larger time_le time_lt timemi
syn keyword pgsqlFunction      time_mi_interval time_mi_time time_ne timenow
syn keyword pgsqlFunction      timeofday time_out timepl time_pl_interval
syn keyword pgsqlFunction      time_recv time_send time_smaller
syn keyword pgsqlFunction      timestamp_cmp_date timestamp_cmp
syn keyword pgsqlFunction      timestamp_cmp_timestamptz timestamp
syn keyword pgsqlFunction      timestamp_eq_date timestamp_eq
syn keyword pgsqlFunction      timestamp_eq_timestamptz timestamp_ge_date
syn keyword pgsqlFunction      timestamp_ge timestamp_ge_timestamptz
syn keyword pgsqlFunction      timestamp_gt_date timestamp_gt
syn keyword pgsqlFunction      timestamp_gt_timestamptz timestamp_hash
syn keyword pgsqlFunction      timestamp_in timestamp_larger timestamp_le_date
syn keyword pgsqlFunction      timestamp_le timestamp_le_timestamptz
syn keyword pgsqlFunction      timestamp_lt_date timestamp_lt
syn keyword pgsqlFunction      timestamp_lt_timestamptz timestamp_mi
syn keyword pgsqlFunction      timestamp_mi_interval timestamp_ne_date
syn keyword pgsqlFunction      timestamp_ne timestamp_ne_timestamptz
syn keyword pgsqlFunction      timestamp_out timestamp_pl_interval timestamp_recv
syn keyword pgsqlFunction      timestamp_send timestamp_smaller timestamptypmodin
syn keyword pgsqlFunction      timestamptypmodout timestamptz_cmp_date
syn keyword pgsqlFunction      timestamptz_cmp timestamptz_cmp_timestamp
syn keyword pgsqlFunction      timestamptz timestamptz_eq_date timestamptz_eq
syn keyword pgsqlFunction      timestamptz_eq_timestamp timestamptz_ge_date
syn keyword pgsqlFunction      timestamptz_ge timestamptz_ge_timestamp
syn keyword pgsqlFunction      timestamptz_gt_date timestamptz_gt
syn keyword pgsqlFunction      timestamptz_gt_timestamp timestamptz_in
syn keyword pgsqlFunction      timestamptz_larger timestamptz_le_date
syn keyword pgsqlFunction      timestamptz_le timestamptz_le_timestamp
syn keyword pgsqlFunction      timestamptz_lt_date timestamptz_lt
syn keyword pgsqlFunction      timestamptz_lt_timestamp timestamptz_mi
syn keyword pgsqlFunction      timestamptz_mi_interval timestamptz_ne_date
syn keyword pgsqlFunction      timestamptz_ne timestamptz_ne_timestamp
syn keyword pgsqlFunction      timestamptz_out timestamptz_pl_interval
syn keyword pgsqlFunction      timestamptz_recv timestamptz_send
syn keyword pgsqlFunction      timestamptz_smaller timestamptztypmodin
syn keyword pgsqlFunction      timestamptztypmodout timetypmodin timetypmodout
syn keyword pgsqlFunction      timetz_cmp timetzdate_pl timetz timetz_eq
syn keyword pgsqlFunction      timetz_ge timetz_gt timetz_hash timetz_in
syn keyword pgsqlFunction      timetz_larger timetz_le timetz_lt
syn keyword pgsqlFunction      timetz_mi_interval timetz_ne timetz_out
syn keyword pgsqlFunction      timetz_pl_interval timetz_recv timetz_send
syn keyword pgsqlFunction      timetz_smaller timetztypmodin timetztypmodout
syn keyword pgsqlFunction      timezone tintervalct tinterval tintervalend
syn keyword pgsqlFunction      tintervaleq tintervalge tintervalgt tintervalin
syn keyword pgsqlFunction      tintervalle tintervalleneq tintervallenge
syn keyword pgsqlFunction      tintervallengt tintervallenle tintervallenlt
syn keyword pgsqlFunction      tintervallenne tintervallt tintervalne
syn keyword pgsqlFunction      tintervalout tintervalov tintervalrecv
syn keyword pgsqlFunction      tintervalrel tintervalsame tintervalsend
syn keyword pgsqlFunction      tintervalstart to_ascii to_char to_date to_hex
syn keyword pgsqlFunction      to_number to_timestamp to_tsquery to_tsvector
syn keyword pgsqlFunction      transaction_timestamp translate trigger_in
syn keyword pgsqlFunction      trigger_out trunc ts_debug ts_headline ts_lexize
syn keyword pgsqlFunction      tsmatchjoinsel ts_match_qv tsmatchsel ts_match_tq
syn keyword pgsqlFunction      ts_match_tt ts_match_vq ts_parse tsq_mcontained
syn keyword pgsqlFunction      tsq_mcontains tsquery_and tsquery_cmp tsquery_eq
syn keyword pgsqlFunction      tsquery_ge tsquery_gt tsqueryin tsquery_le
syn keyword pgsqlFunction      tsquery_lt tsquery_ne tsquery_not tsquery_or
syn keyword pgsqlFunction      tsqueryout tsqueryrecv tsquerysend ts_rank_cd
syn keyword pgsqlFunction      ts_rank ts_rewrite ts_stat ts_token_type
syn keyword pgsqlFunction      ts_typanalyze tsvector_cmp tsvector_concat
syn keyword pgsqlFunction      tsvector_eq tsvector_ge tsvector_gt tsvectorin
syn keyword pgsqlFunction      tsvector_le tsvector_lt tsvector_ne tsvectorout
syn keyword pgsqlFunction      tsvectorrecv tsvectorsend
syn keyword pgsqlFunction      tsvector_update_trigger_column
syn keyword pgsqlFunction      tsvector_update_trigger txid_current
syn keyword pgsqlFunction      txid_current_snapshot txid_snapshot_in
syn keyword pgsqlFunction      txid_snapshot_out txid_snapshot_recv
syn keyword pgsqlFunction      txid_snapshot_send txid_snapshot_xip
syn keyword pgsqlFunction      txid_snapshot_xmax txid_snapshot_xmin
syn keyword pgsqlFunction      txid_visible_in_snapshot uhc_to_utf8
syn keyword pgsqlFunction      unique_key_recheck unknownin unknownout
syn keyword pgsqlFunction      unknownrecv unknownsend unnest upper utf8_to_ascii
syn keyword pgsqlFunction      utf8_to_big5 utf8_to_euc_cn utf8_to_euc_jis_2004
syn keyword pgsqlFunction      utf8_to_euc_jp utf8_to_euc_kr utf8_to_euc_tw
syn keyword pgsqlFunction      utf8_to_gb18030 utf8_to_gbk utf8_to_iso8859_1
syn keyword pgsqlFunction      utf8_to_iso8859 utf8_to_johab utf8_to_koi8r
syn keyword pgsqlFunction      utf8_to_koi8u utf8_to_shift_jis_2004 utf8_to_sjis
syn keyword pgsqlFunction      utf8_to_uhc utf8_to_win uuid_cmp uuid_eq uuid_ge
syn keyword pgsqlFunction      uuid_gt uuid_hash uuid_in uuid_le uuid_lt uuid_ne
syn keyword pgsqlFunction      uuid_out uuid_recv uuid_send varbitcmp varbit
syn keyword pgsqlFunction      varbiteq varbitge varbitgt varbit_in varbitle
syn keyword pgsqlFunction      varbitlt varbitne varbit_out varbit_recv
syn keyword pgsqlFunction      varbit_send varbittypmodin varbittypmodout
syn keyword pgsqlFunction      varcharin varcharout varcharrecv varcharsend
syn keyword pgsqlFunction      varchartypmodin varchartypmodout variance var_pop
syn keyword pgsqlFunction      var_samp version void_in void_out width_bucket
syn keyword pgsqlFunction      width win1250_to_latin2 win1250_to_mic
syn keyword pgsqlFunction      win1251_to_iso win1251_to_koi8r win1251_to_mic
syn keyword pgsqlFunction      win1251_to_win866 win866_to_iso win866_to_koi8r
syn keyword pgsqlFunction      win866_to_mic win866_to_win1251 win_to_utf8 xideq
syn keyword pgsqlFunction      xideqint4 xidin xidout xidrecv xidsend xmlagg
syn keyword pgsqlFunction      xmlcomment xmlconcat2 xml xml_in xml_out xml_recv
syn keyword pgsqlFunction      xml_send xmlvalidate xpath

" }}}
" Define the default highlighting {{{

" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_pgsql_syn_inits")
  if version < 508
    let did_pgsql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pgsqlKeyword    Statement
  HiLink pgsqlSpecial    Type
  HiLink pgsqlString     String
  HiLink pgsqlNumber     Number
  HiLink pgsqlVariable   Identifier
  HiLink pgsqlComment    Comment
  HiLink pgsqlType       Type
  HiLink pgsqlOperator   Statement
  HiLink pgsqlFlow       Statement
  HiLink pgsqlFunction   Function
  HiLink pgsqlCreate     CREATE
  delcommand HiLink
endif

let b:current_syntax = "pgsql"

" }}}

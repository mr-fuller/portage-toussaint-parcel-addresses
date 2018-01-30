with 

parcel_join as (   
select s.*, b.wshd_name from portage_ottawa_cauv s 
join portage_touss_boundary b
on ST_intersects(s.geom,b.geom)),

uniques as(
select parcelid, count(distinct wshd_name) as unique_wshd_names
from parcel_join
group by parcelid)




select parcelid,
--parcel_join.*,
uniques.unique_wshd_names
from parcel_join
join uniques
using (parcelid)
order by unique_wshd_names desc;
--select p.*, count( distinct p.wshd_name ) as double_dip 
--from parcel_join p
--order by double_dip desc;
--select s.*, count(distinct wshd_name) as double_dip from portage_touss_boundary b
--join portage_ottawa_cauv s
--on s.parcelid = parcelid


--group by parcelid

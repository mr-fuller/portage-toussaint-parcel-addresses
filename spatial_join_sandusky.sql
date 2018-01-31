select 
    --s.parcel as parcel_id,
min(s.ownname) as owner,
--min(s.address) as prop_addr,
--min(s.mail_addr) as mail_addr,    
min(ownattenti) as attn, --|| ' ' ||
min(ownstrnum) as street_num, --|| ' ' || 
min(ownstrdir) as street_dir, --||' ' ||
min(ownstrnam) as street_nam, --||' ' ||
min(ownstsuf) as street_suffix, --||' ' || 
min(ownsufdir), --||' ' || 
min(ownseconda) as addr2, --||' ' ||
min(owncity) as city, --||' ' || 
min(ownstate) as state_, --|| ' ' ||
min(ownzipcode) as zipcode,--) as owner_address,
--array_agg(distinct s.address) as addresses, 
array_agg(distinct b.wshd_name) as wshds,
array_agg(distinct s.mpropertyn) as parcel_ids
from portage_sand_cauv s 
join portage_touss_boundary b
on ST_intersects(s.geom,b.geom)
group by s.ownname
order by wshds desc;
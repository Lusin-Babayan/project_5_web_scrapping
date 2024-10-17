select 
"Item ID",
"Title",
replace(zip_data_updated, '''', '"')::json->>'Shipping:' as shipping
from "raw_data";

update raw_data set "Price" = price."Price"
from price where price."Item ID" = raw_data."Item ID";
	
SELECT DISTINCT unnest(string_to_array(trim(both '[]' from "Labels"), ', ')) AS distinct_elements
FROM raw_data;


update raw_data set zip_data_updated= trim("Zip_data");
update raw_data set zip_data_updated= replace("Zip_data", '"', '');
update raw_data set zip_data_updated= replace("zip_data_updated", '''“', '''');
update raw_data set zip_data_updated= replace("zip_data_updated", '”''', '''');
update raw_data set zip_data_updated= replace("zip_data_updated", '“', '''');
update raw_data set zip_data_updated= replace("zip_data_updated", '”', '''');
update raw_data set zip_data_updated= replace("zip_data_updated", 'can''t', 'can not');

drop table if exists structured_feedback_data;
SELECT 
"Item ID" AS item_id,
"Title" AS title,
"Price" AS price,
"Labels" AS labels,
"Values" AS values,
"Zip_data" AS zip_data,
"Feedback" AS feedback,
"Feedback_clean" AS feedback_clean,
zip_data_updated as zip_data_updated,
replace(zip_data_updated, '''', '"')::json->>'Custom Bundle' AS Custom_Bundle,
replace(zip_data_updated, '''', '"')::json->>'Free Accessories' AS Free_Accessories,
replace(zip_data_updated, '''', '"')::json->>'Super AMOLED display' AS Super_AMOLED_display,
replace(zip_data_updated, '''', '"')::json->>'Unlock Status' AS Unlock_Status,
replace(zip_data_updated, '''', '"')::json->>'Delivery:' AS Delivery,
replace(zip_data_updated, '''', '"')::json->>'UPC' AS UPC,
replace(zip_data_updated, '''', '"')::json->>'Capacity of Battery' AS Capacity_of_Battery,
replace(zip_data_updated, '''', '"')::json->>'Contract' AS Contract,
replace(zip_data_updated, '''', '"')::json->>'Screen Size' AS Screen_Size,
replace(zip_data_updated, '''', '"')::json->>'Size Type' AS Size_Type,
replace(zip_data_updated, '''', '"')::json->>'SIM Card Slot' AS SIM_Card_Slot,
replace(zip_data_updated, '''', '"')::json->>'Year Released' AS Year_Released,
replace(zip_data_updated, '''', '"')::json->>'Features' AS Features,
replace(zip_data_updated, '''', '"')::json->>'Local Warehouse' AS Local_Warehouse,
replace(zip_data_updated, '''', '"')::json->>'Release Date' AS Release_Date,
replace(zip_data_updated, '''', '"')::json->>'Country/Region of Manufacture' AS Country_Region_of_Manufacture,
replace(zip_data_updated, '''', '"')::json->>'Best Use for' AS Best_Use_for,
replace(zip_data_updated, '''', '"')::json->>'Brand' AS Brand,
replace(zip_data_updated, '''', '"')::json->>'Network' AS Network,
replace(zip_data_updated, '''', '"')::json->>'Charger and cable' AS Charger_and_cable,
replace(zip_data_updated, '''', '"')::json->>'Seller Notes' AS Seller_Notes,
replace(zip_data_updated, '''', '"')::json->>'MPN' AS MPN,
replace(zip_data_updated, '''', '"')::json->>'Operating System' AS Operating_System,
replace(zip_data_updated, '''', '"')::json->>'RAM' AS RAM,
coalesce(replace(zip_data_updated, '''', '"')::json->>'Samsung Galaxy A15 5G: Budget-Friendly Phone',
replace(zip_data_updated, '''', '"')::json->>'Samsung Galaxy A15 5G Budget-friendly phone') AS Samsung_Galaxy_A15_5G_Budget_friendly_phone,
replace(zip_data_updated, '''', '"')::json->>'Compared to Samsung Galaxy A54 A34' AS Compared_to_Samsung_Galaxy_A54_A34,
replace(zip_data_updated, '''', '"')::json->>'Hardware Connectivity' AS Hardware_Connectivity,
replace(zip_data_updated, '''', '"')::json->>'Condition' AS Condition,
replace(zip_data_updated, '''', '"')::json->>'Modified Item' AS Modified_Item,
replace(zip_data_updated, '''', '"')::json->>'Camera Resolution' AS Camera_Resolution,
replace(zip_data_updated, '''', '"')::json->>'Cellular Band' AS Cellular_Band,
replace(zip_data_updated, '''', '"')::json->>'Import charges: ' AS Import_charges,
replace(zip_data_updated, '''', '"')::json->>'Bundle Listing' AS Bundle_Listing,
replace(zip_data_updated, '''', '"')::json->>'Bundled Items' AS Bundled_Items,
replace(zip_data_updated, '''', '"')::json->>'Shipping:' AS Shipping,
replace(zip_data_updated, '''', '"')::json->>'A54 Graphite A54 Silver A54 Purple' AS A54_Graphite_A54_Silver_A54_Purple,
replace(zip_data_updated, '''', '"')::json->>'Chipset Model' AS Chipset_Model,
replace(zip_data_updated, '''', '"')::json->>'Newer Model of Samsung Galaxy A32' AS Newer_Model_of_Samsung_Galaxy_A32,
replace(zip_data_updated, '''', '"')::json->>'Notice' AS Notice,
replace(zip_data_updated, '''', '"')::json->>'Original box' AS Original_box,
replace(zip_data_updated, '''', '"')::json->>'Style' AS Style,
replace(zip_data_updated, '''', '"')::json->>'Model Number' AS Model_Number,
replace(zip_data_updated, '''', '"')::json->>'tips' AS tips,
replace(zip_data_updated, '''', '"')::json->>'32MP front-facing camera 5000mAh battery 25W fast charging' AS thirtytwoMP_front_facing_camera_5000mAh_battery_25W_fast_charging,
replace(zip_data_updated, '''', '"')::json->>'Returns:' AS Return_s,
replace(zip_data_updated, '''', '"')::json->>'Storage Capacity' AS Storage_Capacity,
replace(zip_data_updated, '''', '"')::json->>'Model' AS Model,
replace(zip_data_updated, '''', '"')::json->>'Non-Domestic Product' AS Non_Domestic_Product,
replace(zip_data_updated, '''', '"')::json->>'Manufacturer Warranty' AS Manufacturer_Warranty,
replace(zip_data_updated, '''', '"')::json->>'Processor' AS Processor,
replace(zip_data_updated, '''', '"')::json->>'SKU' AS SKU,
replace(zip_data_updated, '''', '"')::json->>'Manufacturer Color' AS Manufacturer_Color,
replace(zip_data_updated, '''', '"')::json->>'Battery Health/Capacity' AS Battery_Health_Capacity,
replace(zip_data_updated, '''', '"')::json->>'Connectivity' AS Connectivity,
replace(zip_data_updated, '''', '"')::json->>'Released Year' AS Released_Year,
replace(zip_data_updated, '''', '"')::json->>'Color' AS Color,
replace(zip_data_updated, '''', '"')::json->>'design similar to' AS design_similar_to,
replace(zip_data_updated, '''', '"')::json->>'Lock Status' AS Lock_Status,
replace(zip_data_updated, '''', '"')::json->>'EAN' AS EAN,
replace(zip_data_updated, '''', '"')::json->>'Memory Card Type' AS Memory_Card_Type,
replace(zip_data_updated, '''', '"')::json->>'Cosmetic condition' AS Cosmetic_condition,
replace(zip_data_updated, '''', '"')::json->>'5G smartphone Super AMOLED display Exynos 1380 processor' AS fiveG_smartphone_Super_AMOLED_display_Exynos_1380_processor
--into structured_feedback_data
from raw_data;
 
 
 
 alter table structured_feedback_data
 add column price_num  money; 
 
 
 update structured_feedback_data set price = replace(price, '/ea', '');
 update structured_feedback_data set price_num = replace(price, 'US $', '')::money;

 
 
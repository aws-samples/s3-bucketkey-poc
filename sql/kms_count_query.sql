SELECT 
              resources[1].arn as key_arn,        
          count(resources) as count
  FROM cloudtrail_logs_region
  WHERE eventsource='kms.amazonaws.com'
          AND timestamp between '2021/04/01' and '2022/12/31'
          AND eventname in ('Decrypt','Encrypt','GenerateDataKey')
         AND json_extract(json_extract(requestparameters , '$.encryptionContext'),'$.aws:s3:arn') is not null 
AND resources[1].arn IN (KMSKeyARN1-Value ',’ KMSKeyARN2-value’)
  GROUP BY resources[1].arn
  ORDER BY  key_arn,count desc

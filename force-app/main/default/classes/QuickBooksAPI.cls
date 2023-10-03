public class QuickBooksAPI {
    // @AuraEnabled(cacheable = true)
    //     public static String createExpense(String reqBody) {
    //         Http http = new Http();
    //         HttpRequest request = new HttpRequest();
    //         request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/purchase?minorversion=40');
    //         request.setMethod('POST');
    //         request.setHeader('Content-Type', 'application/json');
    //         request.setHeader('Accept', 'application/json');
    //         request.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
    //         String requestBody = reqBody;
    //         // String requestBody = '{"PaymentType": "CreditCard", "AccountRef": {"name": "Visa", "value": "42"},"EntityRef": {"value": "43", "name": "Mahoney Mugs","type": "Vendor"}, "Line": [{"DetailType": "AccountBasedExpenseLineDetail", "Amount": 37.0, "AccountBasedExpenseLineDetail": {"AccountRef": {"name": "Meals and Entertainment", "value": "13"}}}]}';

    //         // String requestBody = '{"PaymentType": "CreditCard", "AccountRef": {"name": "Visa", "value": "42"}, "Line": [{"DetailType": "AccountBasedExpenseLineDetail", "Amount": 30.0, "AccountBasedExpenseLineDetail": {"AccountRef": {"name": "Meals and Entertainment", "value": "13"}}}]}';
    //         request.setBody(requestBody);
    //         HttpResponse response = http.send(request);
    //         return response.getBody();
    //     }
        @AuraEnabled(cacheable = true)
        public static String createExpense(String reqBody, String attachmentBody, String attachmentName, String attachmentType) {
            // Create the expense
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/purchase?minorversion=40');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept', 'application/json');
            request.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
            String requestBody = reqBody;
            request.setBody(requestBody);
            HttpResponse response = http.send(request);
            
            // Parse the response to get the created expense ID
            Map<String, Object> expense = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String expenseId = (String) expense.get('Id');

            if(response.getStatusCode() == 200){
                addAttachment(expenseId,attachmentBody, attachmentName, attachmentType);

            }
            // // Create the attachment
            // String boundary = 'YOjcLaTlykb6OxfYJx4O07j1MweeMFem';
            // String attachableRef = '{"AttachableRef": [{"EntityRef": {"type": "Purchase", "value": "' + expenseId + '"}}], "FileName": "' + attachmentName + '", "ContentType": "' + attachmentType + '"}';
            
            // String body = '--' + boundary + '\r\n';
            // body += 'Content-Disposition: form-data; name="file_metadata_01"; filename="attachment.json"\r\n';
            // body += 'Content-Type: application/json; charset=UTF-8\r\n';
            // body += 'Content-Transfer-Encoding: 8bit\r\n\r\n';
            // body += attachableRef + '\r\n';
            
            // body += '--' + boundary + '\r\n';
            // body += 'Content-Disposition: form-data; name="file_content_01"; filename="' + attachmentName + '"\r\n';
            // body += 'Content-Type: ' + attachmentType + '\r\n';
            // body += 'Content-Transfer-Encoding: base64\r\n\r\n';
            // body += attachmentBody + '\r\n';
            
            // body += '--' + boundary + '--\r\n';
        
            // HttpRequest attachmentRequest = new HttpRequest();
            // attachmentRequest.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/upload');
            // attachmentRequest.setMethod('POST');
            // attachmentRequest.setHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
            // attachmentRequest.setHeader('Accept', 'application/json');
            // attachmentRequest.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
            // attachmentRequest.setBody(body);
            
            // HttpResponse attachmentResponse = http.send(attachmentRequest);
            System.debug('Attachment Response Body' + response.getBody());
            
            return response.getBody();
        }
        @future(callout=true)
        public static void addAttachment( String expenseId , String attachmentBody, String attachmentName, String attachmentType ){

                // Create the attachment
                String boundary = 'YOjcLaTlykb6OxfYJx4O07j1MweeMFem';
                String attachableRef = '{"AttachableRef": [{"EntityRef": {"type": "Purchase", "value": "' + expenseId + '"}}], "FileName": "' + attachmentName + '", "ContentType": "' + attachmentType + '"}';
                
                String body = '--' + boundary + '\r\n';
                body += 'Content-Disposition: form-data; name="file_metadata_01"; filename="attachment.json"\r\n';
                body += 'Content-Type: application/json; charset=UTF-8\r\n';
                body += 'Content-Transfer-Encoding: 8bit\r\n\r\n';
                body += attachableRef + '\r\n';
                
                body += '--' + boundary + '\r\n';
                body += 'Content-Disposition: form-data; name="file_content_01"; filename="' + attachmentName + '"\r\n';
                body += 'Content-Type: ' + attachmentType + '\r\n';
                body += 'Content-Transfer-Encoding: base64\r\n\r\n';
                body += attachmentBody + '\r\n';
                
                body += '--' + boundary + '--\r\n';
            
                HttpRequest attachmentRequest = new HttpRequest();
                attachmentRequest.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/upload');
                attachmentRequest.setMethod('POST');
                attachmentRequest.setHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
                attachmentRequest.setHeader('Accept', 'application/json');
                attachmentRequest.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
                attachmentRequest.setBody(body);
                
                Http http = new Http();
                HttpResponse attachmentResponse = http.send(attachmentRequest);

                System.debug('Attachment response Body' + attachmentResponse.getBody());

        }

    @AuraEnabled(cacheable = true)
    public static string getPaymentAccounts(){
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String query = 'SELECT * FROM Account WHERE AccountType = \'Bank\'';
            String encodedQuery = EncodingUtil.urlEncode(query, 'UTF-8');
            request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/query?query=' + encodedQuery + '&minorversion=65');
            request.setMethod('GET');
            request.setHeader('Content-Type', 'text/plain');
            request.setHeader('Accept', 'application/json');
            request.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
            HttpResponse response = http.send(request);
            System.debug('Reponse' + response );
            System.debug('Response Body' + response.getBody());
            return response.getBody();
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static string getPaymentAccounts2(){
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String query = 'SELECT * FROM Account WHERE AccountType = \'Credit Card\'';
            String encodedQuery = EncodingUtil.urlEncode(query, 'UTF-8');
            request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/query?query=' + encodedQuery + '&minorversion=65');
            request.setMethod('GET');
            request.setHeader('Content-Type', 'text/plain');
            request.setHeader('Accept', 'application/json');
            request.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
            HttpResponse response = http.send(request);
            System.debug('Reponse' + response );
            System.debug('Response Body' + response.getBody());
            return response.getBody();
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static string getExpenseCategory(){
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String query = 'SELECT * FROM Account WHERE AccountType = \'Expense\'';
            String encodedQuery = EncodingUtil.urlEncode(query, 'UTF-8');
            request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/query?query=' + encodedQuery + '&minorversion=65');
            request.setMethod('GET');
            request.setHeader('Content-Type', 'text/plain');
            request.setHeader('Accept', 'application/json');
            request.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
            HttpResponse response = http.send(request);
            System.debug('Reponse' + response );
            System.debug('Response Body' + response.getBody());
            return response.getBody();
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static string getVendors(){
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            String query = 'SELECT * FROM vendor ';
            String encodedQuery = EncodingUtil.urlEncode(query, 'UTF-8');
            request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365313181220/query?query=' + encodedQuery + '&minorversion=65');
            request.setMethod('GET');
            request.setHeader('Content-Type', 'text/plain');
            request.setHeader('Accept', 'application/json');
            request.setHeader('authorization', 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..cc2RSD6BSf4RoMWt1KCqpg.pIN94GzRi2oM8lyaR8f5QUB7bziQ-_AYwptVYHCng-dGtscDWgHyswb78I8nO1MnWdfgBIprxQad-Yu6MJuI_dEeCyy3F_FJlCFd2uH0-gM6fY1FnIqdXv2Xyw5xYydznQtP2oYrqchPa8M369dwq9AurDJHO0S13gC2P9RzooTj-CzNKv3FI0AoBWL6nYzbgUji0bHvY2zYBxtLLwxoQl_sxd8c6fwZjC6qL95POVnOfzT_TEupUu2BMWnW7X1gkuvlT09frEaDk4DPr-CToiKRrLE-vPBTg8dl4OJKJnuhwHSiOUqmYPjRfmoeDwRLdjLRVJjT0YXbRkrMQfbmRzb-lS_JMaHd4shp5bTyZIVPfHGz5O91juIQKD8qnxoJx-V1N_i1FARYVrCUk25IiVwE5QhuzPxg_yT6sa3EqOJNM48nbEvVdWeRxM0gJYsMP4IQAhPuzLmHrE2dnQQaH10tGP072VKwjmsKWIqfYU1ZOpNMqePkxBNu1psfP9PAQCjJtyz7LmkD2-pCF-7U_FBoq4L9hGPKGobEktExvaNOScqi8UsgsGK9JRcQew2CpXFJ19-KZF-QzrzXkDksi3EVJSVYzKy2_IlP8chmI9fPRQvj6CENuJFjlMP_pggVFjpJnUmZCwBUV8lwOVmUVlVXYWOqqz5BsndTPn0ytcGwbNXihrGMkEOJOyIhVeStl6lQZr18F_L9A3oIoCwNs1nYafTosMl6nPrjGkKUrmBhcjqvHIXAJQeiRODmE4Ub.RZ_wSqTVQrXCtbkcfe-J-Q');
            HttpResponse response = http.send(request);
            System.debug('Reponse' + response );
            System.debug('Response Body' + response.getBody());
            return response.getBody();
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
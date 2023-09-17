import { LightningElement } from 'lwc';
import shortenUrl from '@salesforce/apex/urlShort.urlCall';

export default class url_Shortner_lwc extends LightningElement {
    
    url = '';
    shortenedUrls;
    error= '';
     
    handleUrlChange(event) {
        this.url = event.target.value;
    }

    async shortenUrl() {
        
        this.shortenedUrls = null; // Reset to null or an empty array
        this.error = null;
        
        try {
            this.shortenedUrls = await shortenUrl({ query: this.url });
        } catch (error) {
            this.error = 'Invalid URL';
            console.error('Error:', error);
        }
    }
}

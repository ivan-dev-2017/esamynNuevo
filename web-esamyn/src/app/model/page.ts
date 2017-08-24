export class Page {
    //The number of elements in the page
    public size: number = 1;
    public pageSize: number = 1;
    //The total number of elements
	public totalElements: number = 1;
	public totalResults: number = 1;
    //The total number of pages
	public totalPages: number = 1;
    //The current page number
	public pageNumber: number = 1;
    public currentPage: number = 1;

	public start: number = 0;
    
	public end: number = 1;

	public isPaginated: string = "Y";

	public sortFields: string = "";

	public sortDirections: string = "";



	/*get pageSize(): number {
	    return this.pageSize;
	}
	
	set pageSize(newSize: number) {
		this.pageSize = newSize;
	}
	
	get size(): number {
	    return this.size;
	}
	
	set size(newSize: number) {
		this.size = newSize;
	}
	
	get totalElements(): number {
	    return this.totalElements;
	}
	
	set totalElements(newTotalElementse: number) {
		this.totalElements = newTotalElementse;
	}
	
	get totalResults(): number {
	    return this.totalResults;
	}
	
	set totalResults(newTotalElementse: number) {
		this.totalResults = newTotalElementse;
	}
	
	get totalPages(): number {
	    return this.totalPages;
	}
	
	set totalPages(newTotalPages: number) {
		this.totalPages = newTotalPages;
	}
	
	get pageNumber(): number {
	    return this.pageNumber;
	}
	
	set pageNumber(newPageNumber: number) {
		this.pageNumber = newPageNumber;
	}
	
	get currentPage(): number {
	    return this.currentPage;
	}
	
	set currentPage(newPageNumber: number) {
		this.currentPage = newPageNumber;
	}
	
	get start(): number {
	    return (this.pageNumber-1) * this.size;
	}
	
	set start(newStart: number) {
		this.start = newStart;
	}
	
	get end(): number {
	    return  Math.min((this.start + this.size), this.totalElements);
	}
	
	set end(newEnd: number) {
		this.end = newEnd;
	}
	
	get isPaginated(): string {
	    return  this.isPaginated;
	}
	
	set isPaginated(newIsPaginated: string) {
		this.isPaginated = newIsPaginated;
	}*/

}
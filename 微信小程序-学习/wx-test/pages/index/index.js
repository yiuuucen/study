Page({

  data: {
      movies:[],
      page:1,
      size:6,
      loading:true
  },
  
  onLoad(){
    this.loadMovies()
  },

  loadMovies(){
    const { page,size }=this.data;
    
    this.setData({loading:true})
    wx.request({
      url: 'https://db.miaov.com/doubanapi/v0/movie/list?base=true&page=${page}&size=${size}',
      success: (res)=>{
        

        const {data}=res.data        
        const movies=this.data.movies

        for(let i=0;i<data.length;i+=2){
          movies.push([data[i],data[i+1]?data[i+1]:null])
        }

        this.setData({movies, loading:false})
      }
    })
  },
  scrollHandler(){
    const {page}=this.data
    this.setData({
      page:page+1
    })
    this.loadMovies()
  },

  gotoDetailHandler(e){
    // console.log(e)
    const {id}=e.currentTarget.dataset
    wx.navigateTo({
      url: '../movie-detail/movie-detail?id='+id,
    })
  }
}) 
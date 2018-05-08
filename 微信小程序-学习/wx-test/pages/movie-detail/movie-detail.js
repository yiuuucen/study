// pages/movie-detail/movie-detail.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    moive:{}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.showLoading({
      title: '',
    })

    // console.log(options)
    const {id}=options
    wx.request({
      url: 'https://db.miaov.com/doubanapi/v0/movie/detail/'+id,
      success:(res)=>{       
        const movie=res.data.data      
        this.setData({movie})
        // console.log(movie)
        wx.hideLoading()
      }
    })
  },
})
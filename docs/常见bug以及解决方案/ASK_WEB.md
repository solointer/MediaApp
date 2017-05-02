### 对body内的元素设置margin-top影响了body的位置

+ 这个问题发生的原因是根据规范，一个盒子如果没有上补白(padding-top)和上边框(border-top)，那么这个盒子的上边距会和其内部文档流中的第一个子元素的上边距重叠。

+ 父元素的第一个子元素的上边距margin-top如果碰不到有效的border或者padding.就会不断一层一层的找自己 “领导”(父元素，祖先元素)的麻烦。只要给领导设置个有效的 border或者padding就可以有效的管制这个目无领导的margin防止它越级，假传圣旨，把自己的margin当领导的margin执行。（本项目中为wrap增加了padding:1px的样式解决了这个bug)

+ React 执行onclikc事件的时候报错

    错误信息：setState(...): Cannot update during an existing state transition (such as within render or another component's constructor)

    文题根源：大体意思就是在render这种需要props和state进行渲染的方法中，不能再对props和state进行更新。我的理解是，React会在props和state改变的时候调用 render进行DOM diff然后渲染，如果在渲染过程中再对props和states进行更改，就陷入死循环了。

    解决办法：在调用方法时创建一个匿名函数，再调用。

      修改TabControl组件
      tagChange用来改变state
      {React.Children.map(this.props.children, (element, index) => {
            return (<div onClick={this.tagChange(index)} className={that.getTitleItemCssClasses(index)}>{element.props.name}</div>)
      })}

      {React.Children.map(this.props.children, (element, index) => {
            return (<div onClick={()=>{this.tagChange(index)}} className={that.getTitleItemCssClasses(index)}>{element.props.name}</div>)
      })}

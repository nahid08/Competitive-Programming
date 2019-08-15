///Allah gave me the brain.Allah will help me///
/*
Nahid Hossain
Jahangirnagar University
Roll:54
*/
#include<bits/stdc++.h>
#define ll          long long int
#define db          double
#define pf          printf
#define sf          scanf
#define ff          first
#define ss          second
#define clr         clear()
#define sz          size()
#define pb          push_back
#define mk          make_pair
#define pi          acos(-1)
#define inf         10e14
#define mod         1000000007
#define ull         unsigned long long int
#define f(i,k,n)    for(ll i=k;i<n;i++)
#define fr(i,n,k)   for(i=n;i>=k;i--)
#define ent(a)      scanf("%lld",&a)
#define ent2(a,b)   scanf("%lld%lld",&a,&b)
#define ent3(a,b,c) scanf("%lld%lld%lld",&a,&b,&c)
#define mem(a)      memset(a,0,sizeof(a))
#define vec(v,s)    vector<ll>v[s]
#define arr(a,s)    ll a[s];
//#define check(n,pos) (n&(1<<pos))
//#define set(n,pos)  (n|(1<<pos))
//knight and king//
int dr[]= {2, 2, -2, -2, 1, -1, 1, -1};
int dc[]= {1,-1,  1, -1, 2,  2,-2, -2};
int dr1[]= {0, 0, 0, 1, 1, 1, -1, -1, -1};
int dc1[]= {-1,0, 1,-1, 0, 1, -1, 0,   1};
int dr2[]= {0, 0, 1, -1};
int dc2[]= {1,-1, 0,  0};
////////////////////////////
using namespace std;

#define ma 100005

struct data
{
 ll l,r,id;
}q[ma];

ll a[ma],block,fr[ma],max1,fr1[ma];

bool cmp(data a,data b)
{
 ll p=a.l/block;ll p1=b.l/block;
 if(p!=p1)return p<p1;
 if(a.r!=b.r)return a.r<b.r;
 return a.l<b.l;
}

ll ans[ma];

void add(ll x)
{
 fr1[fr[x]]--;
 fr[x]++;
 max1=max(max1,fr[x]);
 fr1[fr[x]]++;

}


void rem(ll x)
{
 fr1[fr[x]]--;
 if(fr[x]==max1&&fr1[fr[x]]==0)max1=fr[x]-1;
 fr[x]--;
 fr1[fr[x]]++;

}


int main()
{
 ll n,q1,i,j,x,y;

 while(cin>>n)
 {
  if(n==0)break;
  cin>>q1;

 map<ll,ll>mp;

 vector<ll>v;

 ll cn=0;

 for(i=1;i<=n;i++)
 {
  cin>>a[i];
  v.pb(a[i]);
 }

 sort(v.begin(),v.end());

 for(i=0;i<v.sz;i++)
 {
  if(mp[v[i]]==0)mp[v[i]]=++cn;
 }

 for(i=1;i<=n;i++)a[i]=mp[a[i]];


 block=sqrt(n+1);

 for(i=1;i<=q1;i++)
 {
  cin>>x>>y;
  q[i].l=x;
  q[i].r=y;
  q[i].id=i;
 }
 sort(q+1,q+q1+1,cmp);

 ll l=1,r=0;

 mem(fr);
 mem(fr1);

 max1=0;


 for(i=1;i<=q1;i++)
 {
  ll x=q[i].l;
  ll y=q[i].r;
  ll id=q[i].id;

  while(r<y)
  {
   r++;
   add(a[r]);
  }

  while(r>y)
  {
   rem(a[r]);
   r--;
  }


  while(l>x)
  {
   l--;
   add(a[l]);

  }

  while(l<x)
  {
   rem(a[l]);
   l++;
  }

  ans[id]=max1;





 }


 for(i=1;i<=q1;i++)cout<<ans[i]<<endl;
 }






}
